#!/bin/bash
# Plugin Linter - Check plugin files for style compliance
# Run: ./scripts/lint-plugins.sh [file...]
# If no files specified, checks all plugins/*/commands/*.md

set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

errors=0
warnings=0

lint_file() {
    local file="$1"
    local file_errors=0
    
    echo -e "\n📄 Checking: $file"
    
    # 1. Check for Chinese characters (CJK Unified Ideographs range)
    if grep -oP '[\x{4e00}-\x{9fff}]' "$file" 2>/dev/null | head -1 | grep -q .; then
        echo -e "  ${RED}❌ Contains Chinese characters (must be English only)${NC}"
        ((file_errors++))
    else
        echo -e "  ${GREEN}✅ English only${NC}"
    fi
    
    # 2. Check YAML frontmatter exists
    if ! head -1 "$file" | grep -q '^---$'; then
        echo -e "  ${RED}❌ Missing YAML frontmatter${NC}"
        ((file_errors++))
    else
        echo -e "  ${GREEN}✅ YAML frontmatter${NC}"
    fi
    
    # 3. Check description exists
    if ! grep -q '^description:' "$file"; then
        echo -e "  ${RED}❌ Missing description${NC}"
        ((file_errors++))
    else
        echo -e "  ${GREEN}✅ Description present${NC}"
    fi
    
    # 4. Check allowed-tools is specific (not generic Bash)
    if grep -q '^allowed-tools:.*Bash[^(]' "$file" || grep -q '^allowed-tools: Bash$' "$file"; then
        echo -e "  ${RED}❌ Generic 'Bash' in allowed-tools (use specific patterns like Bash(git:*))${NC}"
        ((file_errors++))
    else
        echo -e "  ${GREEN}✅ Specific allowed-tools${NC}"
    fi
    
    # 5. Check Parameters format (no "User may specify:" except in examples/references)
    if grep -v '^\- \[' "$file" | grep -v '^- \[ \]' | grep -v 'NO "User may specify:"' | grep -q 'User may specify:'; then
        echo -e "  ${RED}❌ Parameters uses 'User may specify:' (use simplified format)${NC}"
        ((file_errors++))
    else
        echo -e "  ${GREEN}✅ Parameters format${NC}"
    fi
    
    # 6. Check for Context section
    if ! grep -q '^## Context' "$file"; then
        echo -e "  ${YELLOW}⚠️  Missing ## Context section${NC}"
        ((warnings++))
    else
        echo -e "  ${GREEN}✅ Context section${NC}"
    fi
    
    # 7. Check for Task section
    if ! grep -qE '^## (Your )?[Tt]ask' "$file"; then
        echo -e "  ${RED}❌ Missing ## Task or ## Your task section${NC}"
        ((file_errors++))
    else
        echo -e "  ${GREEN}✅ Task section${NC}"
    fi
    
    # 8. Check for single-message instruction
    if ! grep -q 'MUST do all.*single message' "$file"; then
        echo -e "  ${YELLOW}⚠️  Missing single-message instruction${NC}"
        ((warnings++))
    else
        echo -e "  ${GREEN}✅ Single-message instruction${NC}"
    fi
    
    errors=$((errors + file_errors))
    return $file_errors
}

# Main
echo "📋 Plugin Lint Report"
echo "===================="

if [ $# -gt 0 ]; then
    # Lint specified files
    files=("$@")
else
    # Lint all plugin command files
    files=($(find plugins -path "*/commands/*.md" 2>/dev/null))
fi

if [ ${#files[@]} -eq 0 ]; then
    echo "No plugin files found."
    exit 0
fi

for file in "${files[@]}"; do
    if [[ "$file" == *"/commands/"*".md" ]]; then
        lint_file "$file" || true
    fi
done

echo ""
echo "===================="
echo -e "Summary: ${RED}$errors error(s)${NC}, ${YELLOW}$warnings warning(s)${NC}"

if [ $errors -gt 0 ]; then
    echo -e "${RED}FAILED: Fix errors before committing.${NC}"
    exit 1
else
    echo -e "${GREEN}PASSED${NC}"
    exit 0
fi
