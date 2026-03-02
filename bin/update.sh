#!/bin/bash

set -e

PACK_NAME="opencode-csp-plan-cook-pack"
MANIFEST_FILE=".opencode/.${PACK_NAME}.manifest"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
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

show_usage() {
    cat << EOF
Usage: $0 [OPTIONS]

Update OpenCode CSP-Plan Cook Pack

OPTIONS:
    -p, --path PATH    Target project path (default: current directory)
    -f, --force        Force update (reinstall all)
    -h, --help         Show this help message

EXAMPLES:
    $0                              # Update current directory
    $0 -p /path/to/project         # Update specific directory

EOF
}

# Parse arguments
TARGET_PATH="$(pwd)"
FORCE=false

while [[ $# -gt 0 ]]; do
    case $1 in
        -p|--path)
            TARGET_PATH="$2"
            shift 2
            ;;
        -f|--force)
            FORCE=true
            shift
            ;;
        -h|--help)
            show_usage
            exit 0
            ;;
        *)
            log_error "Unknown option: $1"
            show_usage
            exit 1
            ;;
    esac
done

# Resolve absolute path
TARGET_PATH="$(cd "$TARGET_PATH" 2>/dev/null && pwd)"

log_info "Updating ${PACK_NAME} in: ${TARGET_PATH}"

MANIFEST_PATH="$TARGET_PATH/$MANIFEST_FILE"

# Check if manifest exists
if [ ! -f "$MANIFEST_PATH" ]; then
    log_warn "Manifest not found: $MANIFEST_PATH"
    log_info "Pack may not be installed. Running install instead..."
    "$(dirname "$0")/install.sh" -p "$TARGET_PATH"
    exit $?
fi

# Get pack directory (resolve symlink to real path)
PACK_DIR="$(cd "$(dirname "$0")/.." && pwd)"
CURRENT_PACK_VERSION=$(grep -m1 '^#.*v' "$MANIFEST_PATH" | sed 's/.*v\([0-9.]*\).*/\1/')

log_info "Current version: v${CURRENT_PACK_VERSION:-unknown}"
log_info "Pack directory: ${PACK_DIR}"

OPENCODE_DIR="$TARGET_PATH/.opencode"

log_step "Analyzing changes..."

# Arrays to track changes
added=()
updated=()
removed=()

# Check skills
log_info "Checking skills..."
SKILLS_DIR="$PACK_DIR/.opencode/skills"
if [ -d "$SKILLS_DIR" ]; then
    for skill_dir in "$SKILLS_DIR"/*; do
        if [ -d "$skill_dir" ]; then
            skill_name=$(basename "$skill_dir")
            source_path="$skill_dir"
            target_path="$OPENCODE_DIR/skills/$skill_name"
            
            if [ -L "$target_path" ]; then
                existing_target=$(readlink -f "$target_path" 2>/dev/null || echo "")
                if [ "$existing_target" != "$source_path" ]; then
                    updated+=("skills/$skill_name")
                else
                    log_info "  - $skill_name (up to date)"
                fi
            else
                added+=("skills/$skill_name")
            fi
        fi
    done
fi

# Check agents
log_info "Checking agents..."
AGENTS_DIR="$PACK_DIR/.opencode/agents"
if [ -d "$AGENTS_DIR" ]; then
    for agent_file in "$AGENTS_DIR"/*.md; do
        if [ -f "$agent_file" ]; then
            agent_name=$(basename "$agent_file" .md)
            source_path="$agent_file"
            target_path="$OPENCODE_DIR/agents/$agent_name.md"
            
            if [ -L "$target_path" ]; then
                existing_target=$(readlink -f "$target_path" 2>/dev/null || echo "")
                if [ "$existing_target" != "$source_path" ]; then
                    updated+=("agents/$agent_name.md")
                else
                    log_info "  - $agent_name (up to date)"
                fi
            else
                added+=("agents/$agent_name.md")
            fi
        fi
    done
fi

# Check commands
log_info "Checking commands..."
COMMANDS_DIR="$PACK_DIR/.opencode/commands"
if [ -d "$COMMANDS_DIR" ]; then
    for cmd_file in "$COMMANDS_DIR"/*.md; do
        if [ -f "$cmd_file" ]; then
            cmd_name=$(basename "$cmd_file" .md)
            source_path="$cmd_file"
            target_path="$OPENCODE_DIR/commands/$cmd_name.md"
            
            if [ -L "$target_path" ]; then
                existing_target=$(readlink -f "$target_path" 2>/dev/null || echo "")
                if [ "$existing_target" != "$source_path" ]; then
                    updated+=("commands/$cmd_name.md")
                else
                    log_info "  - $cmd_name (up to date)"
                fi
            else
                added+=("commands/$cmd_name.md")
            fi
        fi
    done
fi

# Show summary
log_info ""
log_info "============================================"
log_info "Update Summary:"
log_info ""

if [ ${#added[@]} -eq 0 ] && [ ${#updated[@]} -eq 0 ]; then
    log_info "All files are up to date!"
else
    if [ ${#added[@]} -gt 0 ]; then
        log_info "New files to add (${#added[@]}):"
        for item in "${added[@]}"; do
            echo "  + $item"
        done
    fi
    
    if [ ${#updated[@]} -gt 0 ]; then
        log_info "Files to update (${#updated[@]}):"
        for item in "${updated[@]}"; do
            echo "  ~ $item"
        done
    fi
fi

log_info ""

# If force or there are changes, re-run install
if [ "$FORCE" = true ] || [ ${#added[@]} -gt 0 ] || [ ${#updated[@]} -gt 0 ]; then
    log_step "Running reinstall with new/changed files..."
    "$(dirname "$0")/install.sh" -p "$TARGET_PATH" -f
    exit $?
else
    log_info "No update needed."
    log_info ""
    log_info "To force reinstall all files, use: $0 -f"
fi
