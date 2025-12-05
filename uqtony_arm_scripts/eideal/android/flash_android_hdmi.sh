#!/bin/bash

# 1. 記錄當前目錄
ORIG_DIR=$(pwd)
echo "[INFO] 原始目錄: $ORIG_DIR"

# 2. 切換到 out/target/product/eideal_8mm/
TARGET_DIR="out/target/product/eideal_8mm"
echo "[INFO] 切換到: $TARGET_DIR"
cd "$TARGET_DIR" || { echo "[ERROR] 找不到目錄 $TARGET_DIR"; exit 1; }

# 3. 執行 fastboot_imx_flashall.sh
echo "[INFO] 開始執行 fastboot 烧錄..."
sudo ./fastboot_imx_flashall.sh -f imx8mm -e -d hdmi
FLASH_RET=$?

# 4. 回到原目錄
echo "[INFO] 烧錄完成，回到原始目錄..."
cd "$ORIG_DIR"

# 顯示執行結果
if [ $FLASH_RET -eq 0 ]; then
    echo "[INFO] fastboot 執行成功 ✔️"
else
    echo "[ERROR] fastboot 執行失敗 ❌ (exit code: $FLASH_RET)"
fi

