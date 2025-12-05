#!/bin/bash
#
# Clean system, system_ext, product output for AOSP build
# Target directory: out/target/product/eideal_8mm
#

TARGET_PRODUCT="eideal_8mm"
PRODUCT_DIR="out/target/product/$TARGET_PRODUCT"

echo "==========================================="
echo "  Cleaning AOSP output for: $TARGET_PRODUCT"
echo "  Path: $PRODUCT_DIR"
echo "==========================================="

if [ ! -d "$PRODUCT_DIR" ]; then
    echo "❌ ERROR: 找不到 $PRODUCT_DIR"
    echo "請確認你已經 build 過至少一次 AOSP。"
    exit 1
fi

echo ""
echo "🧹 Removing system image directories..."
rm -rf "$PRODUCT_DIR/system"
rm -rf "$PRODUCT_DIR/obj/PACKAGING/system_intermediates"

echo "🧹 Removing system_ext image directories..."
rm -rf "$PRODUCT_DIR/system_ext"
rm -rf "$PRODUCT_DIR/obj/PACKAGING/system_ext_intermediates"

echo "🧹 Removing product image directories..."
rm -rf "$PRODUCT_DIR/product"
rm -rf "$PRODUCT_DIR/obj/PACKAGING/product_intermediates"

echo ""
echo "🧹 Removing possible launcher intermediates..."
find out/target/common/obj/APPS -maxdepth 1 -type d -iname "*launcher*" -exec rm -rf {} \; 2>/dev/null
find out/target/common/obj/APPS -maxdepth 1 -type d -iname "*lookr*"    -exec rm -rf {} \; 2>/dev/null
find out/target/common/obj/APPS -maxdepth 1 -type d -iname "*nova*"     -exec rm -rf {} \; 2>/dev/null

echo ""
echo "✨ Done! system / system_ext / product 已清空。"
echo "➡️ 建議重新 build： m systemimage system_extimage productimage"
echo "➡️ 刷機時記得： fastboot flash system / system_ext / product"
echo ""

