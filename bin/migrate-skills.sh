#!/bin/bash

# =============================================================================
# Migration Script: Claude Skills Pack → OpenCode Skills Pack
# Migrates all skills from claude-skills-pack to opencode-skills-pack
# =============================================================================

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m'

log_info() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

log_warn() {
    echo -e "${YELLOW}[WARN]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

log_step() {
    echo -e "${BLUE}[STEP]${NC} $1"
}

log_section() {
    echo -e "\n${CYAN}════════════════════════════════════════${NC}"
    echo -e "${CYAN}  $1${NC}"
    echo -e "${CYAN}════════════════════════════════════════${NC}\n"
}

# Paths
SOURCE_DIR="/SKILL/claude-skills-pack/skills"
TARGET_DIR="/SKILL/opencode-skills-pack/.opencode/skills"

log_section "🚀 Claude Skills → OpenCode Skills Migration"

log_info "Source: $SOURCE_DIR"
log_info "Target: $TARGET_DIR"

# Counter
MIGRATED=0
SKIPPED=0
ERRORS=0

# Existing skills to skip
EXISTING_SKILLS=("coding-standard" "github-tools" "plan-writing" "prompt-leverage" "test-strategy")

# Function to check if skill exists
skill_exists() {
    local skill_name=$1
    for existing in "${EXISTING_SKILLS[@]}"; do
        if [ "$existing" = "$skill_name" ]; then
            return 0
        fi
    done
    return 1
}

# Function to migrate a single skill
migrate_skill() {
    local skill_dir=$1
    local skill_name=$(basename "$skill_dir")
    local target_skill_dir="$TARGET_DIR/$skill_name"
    
    log_step "Migrating: $skill_name"
    
    # Create target directory
    mkdir -p "$target_skill_dir"
    
    # Copy all files
    cp -r "$skill_dir/"* "$target_skill_dir/"
    
    # Update SKILL.md frontmatter if it exists
    if [ -f "$target_skill_dir/SKILL.md" ]; then
        # Read the file
        local temp_file=$(mktemp)
        local in_frontmatter=false
        local frontmatter_done=false
        local has_compatibility=false
        
        while IFS= read -r line || [[ -n "$line" ]]; do
            # Check for frontmatter start
            if [[ "$line" == "---" ]] && [ "$frontmatter_done" = false ]; then
                if [ "$in_frontmatter" = false ]; then
                    # Start of frontmatter
                    in_frontmatter=true
                    echo "$line" >> "$temp_file"
                else
                    # End of frontmatter - add compatibility if missing
                    frontmatter_done=true
                    if [ "$has_compatibility" = false ]; then
                        echo "compatibility: opencode" >> "$temp_file"
                    fi
                    echo "$line" >> "$temp_file"
                fi
            elif [ "$in_frontmatter" = true ] && [ "$frontmatter_done" = false ]; then
                # Inside frontmatter
                if [[ "$line" == *"allowed-tools"* ]]; then
                    # Skip allowed-tools line
                    continue
                elif [[ "$line" == *"compatibility:"* ]]; then
                    # Already has compatibility
                    has_compatibility=true
                    echo "$line" >> "$temp_file"
                else
                    echo "$line" >> "$temp_file"
                fi
            else
                # Regular content
                echo "$line" >> "$temp_file"
            fi
        done < "$target_skill_dir/SKILL.md"
        
        # Replace original file
        mv "$temp_file" "$target_skill_dir/SKILL.md"
    fi
    
    # Update path references in all .md files
    find "$target_skill_dir" -name "*.md" -type f -exec sed -i 's|\.claude/|\.opencode/|g' {} \;
    find "$target_skill_dir" -name "*.md" -type f -exec sed -i 's|@\[skills/|@\[\.opencode/skills/|g' {} \;
    
    log_info "  ✓ Migrated: $skill_name"
    MIGRATED=$((MIGRATED + 1))
}

# Main migration loop
log_section "📦 Starting Migration"

for skill_dir in "$SOURCE_DIR"/*/; do
    if [ -d "$skill_dir" ]; then
        skill_name=$(basename "$skill_dir")
        
        if skill_exists "$skill_name"; then
            log_warn "Skipping (already exists): $skill_name"
            SKIPPED=$((SKIPPED + 1))
        else
            migrate_skill "$skill_dir" || {
                log_error "Failed to migrate: $skill_name"
                ERRORS=$((ERRORS + 1))
            }
        fi
    fi
done

# Summary
log_section "📊 Migration Summary"
echo -e "Migrated: ${GREEN}$MIGRATED${NC}"
echo -e "Skipped:  ${YELLOW}$SKIPPED${NC}"
echo -e "Errors:   ${RED}$ERRORS${NC}"

if [ $ERRORS -eq 0 ]; then
    log_info "✨ Migration completed successfully!"
else
    log_error "⚠️  Migration completed with $ERRORS errors"
    exit 1
fi
