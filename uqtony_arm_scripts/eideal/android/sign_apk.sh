apk_name=$1
signed_apk_name=$(echo $apk_name|sed 's/.apk/-signed.apk/g')

if [[ $apk_name =~ .*\.apk ]]; then
	signed_apk_name=$signed_apk_name
else
	signed_apk_name="$apk_name-signed.apk"
fi

echo "Sign $apk_name to $signed_apk_name"

./prebuilts/sdk/tools/linux/bin/apksigner sign \
	--key ./device/eideal/common/security/platform.pk8 \
       	--cert ./device/eideal/common/security/platform.x509.pem \
	$apk_name
