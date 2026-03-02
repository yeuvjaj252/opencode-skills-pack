#!/bin/bash

set -e

PACK_NAME="opencode-csp-plan-cook-pack"
MANIFEST_FILE=".opencode/.${PACK_NAME}.manifest"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
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

show_usage() {
    cat << EOF
Usage: $0 [OPTIONS]

Uninstall OpenCode CSP-Plan Cook Pack

OPTIONS:
    -p, --path PATH    Target project path (default: current directory)
    -f, --force        Force uninstall without confirmation
    -h, --help         Show this help message

EXAMPLES:
    $0                              # Uninstall from current directory
    $0 -p /path/to/project         # Uninstall from specific directory
    $0 -p /path/to/project -f     # Force uninstall

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

log_info "Uninstalling ${PACK_NAME} from: ${TARGET_PATH}"

MANIFEST_PATH="$TARGET_PATH/$MANIFEST_FILE"

# Check if manifest exists
if [ ! -f "$MANIFEST_PATH" ]; then
    log_error "Manifest not found: $MANIFEST_PATH"
    log_error "Pack may not be installed. Try running install.sh first."
    exit 1
fi

# Show what will be removed
log_info "Files to be removed:"
echo ""
grep -v '^#' "$MANIFEST_PATH" | grep -v '^$' | while read -r line; do
    if [ -n "$line" ]; then
        echo "  - .opencode/$line"
    fi
done
echo ""

# Confirm uninstallation
if [ "$FORCE" != true ]; then
    echo -n "Continue uninstallation? [y/N] "
    read -r confirm
    if [ "$confirm" != "y" ] && [ "$confirm" != "Y" ]; then
        log_info "Uninstall cancelled"
        exit 0
    fi
fi

# Remove symlinks (only if they point to our pack)
OPENCODE_DIR="$TARGET_PATH/.opencode"
PACK_DIR="$(cd "$(dirname "$0")/.." && pwd)"

# Read manifest and remove symlinks
removed_count=0
while IFS= read -r line; do
    # Skip comments and empty lines
    [[ "$line" =~ ^# ]] && continue
    [[ -z "$line" ]] && continue
    
    target_path="$OPENCODE_DIR/$line"
    
    if [ -L "$target_path" ]; then
        link_target=$(readlink -f "$target_path" 2>/dev/null || echo "")
        
        # Only remove if it's a symlink from our pack
        if [[ "$link_target" == "$PACK_DIR"* ]]; then
            rm -f "$target_path"
            log_info "Removed: .opencode/$line"
            ((removed_count++))
        else
            log_warn "Skipped (not from this pack): .opencode/$line"
        fi
    elif [ -e "$target_path" ]; then
        log_warn "Skipped (not a symlink): .opencode/$line"
    fi
done < "$MANIFEST_PATH"

# Remove manifest file
rm -f "$MANIFEST_PATH"
log_info "Removed manifest file"

# Cleanup empty directories
for dir in skills agents commands; do
    dir_path="$OPENCODE_DIR/$dir"
    if [ -d "$dir_path" ]; then
        if [ -z "$(ls -A "$dir_path" 2>/dev/null)" ]; then
            rmdir "$dir_path"
            log_info "Removed empty directory: .opencode/$dir"
        fi
    fi
done

# Check if .opencode is empty
if [ -d "$OPENCODE_DIR" ]; then
    if [ -z "$(ls -A "$OPENCODE_DIR" 2>/dev/null)" ]; then
        rmdir "$OPENCODE_DIR"
        log_info "Removed empty .opencode directory"
    fi
fi

log_info ""
log_info "============================================"
log_info "Uninstallation complete!"
log_info "Removed $removed_count symlink(s)"
log_info "============================================"
