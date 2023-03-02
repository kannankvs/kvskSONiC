!/usr/bin/env bash
git checkout 
git config --global user.email "kannan_kvs@dell.com"
git config --global user.name "kannankvs"
git reset --hard
git pull origin 


#set -euo pipefail

DEFID_accton="$(curl -s 'Accton' | jq -r '.value[0].id')"
DEFID_alpha="$(curl -s 'Alphanetworks' | jq -r '.value[0].id')"
DEFID_arista="$(curl -s 'Arista' | jq -r '.value[0].id')"

DEFID_BRCM="$(curl -s 'https://dev.azure.com/mssonic/build/_apis/build/definitions?name=Azure.sonic-buildimage.official.broadcom' | jq -r '.value[0].id')"
DEFID_MLNX="$(curl -s 'https://dev.azure.com/mssonic/build/_apis/build/definitions?name=Azure.sonic-buildimage.official.mellanox' | jq -r '.value[0].id')"
DEFID_VS="$(curl -s 'https://dev.azure.com/mssonic/build/_apis/build/definitions?name=Azure.sonic-buildimage.official.vs' | jq -r '.value[0].id')"
DEFID_INNO="$(curl -s 'https://dev.azure.com/mssonic/build/_apis/build/definitions?name=Azure.sonic-buildimage.official.innovium' | jq -r '.value[0].id')"
DEFID_BFT="$(curl -s 'https://dev.azure.com/mssonic/build/_apis/build/definitions?name=Azure.sonic-buildimage.official.barefoot' | jq -r '.value[0].id')"
DEFID_CHE="$(curl -s 'https://dev.azure.com/mssonic/build/_apis/build/definitions?name=Azure.sonic-buildimage.official.cache' | jq -r '.value[0].id')"
DEFID_CTC="$(curl -s 'https://dev.azure.com/mssonic/build/_apis/build/definitions?name=Azure.sonic-buildimage.official.centec' | jq -r '.value[0].id')"
DEFID_CTC64="$(curl -s 'https://dev.azure.com/mssonic/build/_apis/build/definitions?name=Azure.sonic-buildimage.official.centec-arm64' | jq -r '.value[0].id')"
DEFID_GRC="$(curl -s 'https://dev.azure.com/mssonic/build/_apis/build/definitions?name=Azure.sonic-buildimage.official.generic' | jq -r '.value[0].id')"
DEFID_MRV="$(curl -s 'https://dev.azure.com/mssonic/build/_apis/build/definitions?name=Azure.sonic-buildimage.official.marvell-armhf' | jq -r '.value[0].id')"
DEFID_NPH="$(curl -s 'https://dev.azure.com/mssonic/build/_apis/build/definitions?name=Azure.sonic-buildimage.official.nephos' | jq -r '.value[0].id')"

first=1
for BRANCH in  master   
do
	first=''
	BUILD_BRCM="$(curl -s 'https://dev.azure.com/mssonic/build/_apis/build/builds?definitions='"${DEFID_BRCM}"'&branchName=refs/heads/'"${BRANCH}"'&$top=1&resultFilter=succeeded&api-version=6.0' | jq -r '.value[0].id')"
	BUILD_BRCM_TS="$(curl -s 'https://dev.azure.com/mssonic/build/_apis/build/builds/'"${BUILD_BRCM}"'?api-version=6.0' | jq -r '.queueTime')"
	BUILD_MLNX="$(curl -s 'https://dev.azure.com/mssonic/build/_apis/build/builds?definitions='"${DEFID_MLNX}"'&branchName=refs/heads/'"${BRANCH}"'&$top=1&resultFilter=succeeded&api-version=6.0' | jq -r '.value[0].id')"
	BUILD_MLNX_TS="$(curl -s 'https://dev.azure.com/mssonic/build/_apis/build/builds/'"${BUILD_MLNX}"'?api-version=6.0' | jq -r '.queueTime')"
	BUILD_VS="$(curl -s 'https://dev.azure.com/mssonic/build/_apis/build/builds?definitions='"${DEFID_VS}"'&branchName=refs/heads/'"${BRANCH}"'&$top=1&resultFilter=succeeded&api-version=6.0' | jq -r '.value[0].id')"
	BUILD_VS_TS="$(curl -s 'https://dev.azure.com/mssonic/build/_apis/build/builds/'"${BUILD_VS}"'?api-version=6.0' | jq -r '.queueTime')"
	BUILD_INNO="$(curl -s 'https://dev.azure.com/mssonic/build/_apis/build/builds?definitions='"${DEFID_INNO}"'&branchName=refs/heads/'"${BRANCH}"'&$top=1&resultFilter=succeeded&api-version=6.0' | jq -r '.value[0].id')"
	BUILD_INNO_TS="$(curl -s 'https://dev.azure.com/mssonic/build/_apis/build/builds/'"${BUILD_INNO}"'?api-version=6.0' | jq -r '.queueTime')"
	BUILD_BFT="$(curl -s 'https://dev.azure.com/mssonic/build/_apis/build/builds?definitions='"${DEFID_BFT}"'&branchName=refs/heads/'"${BRANCH}"'&$top=1&resultFilter=succeeded&api-version=6.0' | jq -r '.value[0].id')"
	BUILD_BFT_TS="$(curl -s 'https://dev.azure.com/mssonic/build/_apis/build/builds/'"${BUILD_BFT}"'?api-version=6.0' | jq -r '.queueTime')"
	BUILD_CHE="$(curl -s 'https://dev.azure.com/mssonic/build/_apis/build/builds?definitions='"${DEFID_CHE}"'&branchName=refs/heads/'"${BRANCH}"'&$top=1&resultFilter=succeeded&api-version=6.0' | jq -r '.value[0].id')"
	BUILD_CHE_TS="$(curl -s 'https://dev.azure.com/mssonic/build/_apis/build/builds/'"${BUILD_CHE}"'?api-version=6.0' | jq -r '.queueTime')"
	BUILD_CTC="$(curl -s 'https://dev.azure.com/mssonic/build/_apis/build/builds?definitions='"${DEFID_CTC}"'&branchName=refs/heads/'"${BRANCH}"'&$top=1&resultFilter=succeeded&api-version=6.0' | jq -r '.value[0].id')"
	BUILD_CTC_TS="$(curl -s 'https://dev.azure.com/mssonic/build/_apis/build/builds/'"${BUILD_CTC}"'?api-version=6.0' | jq -r '.queueTime')"
	BUILD_CTC64="$(curl -s 'https://dev.azure.com/mssonic/build/_apis/build/builds?definitions='"${DEFID_CTC64}"'&branchName=refs/heads/'"${BRANCH}"'&$top=1&resultFilter=succeeded&api-version=6.0' | jq -r '.value[0].id')"
	BUILD_CTC64_TS="$(curl -s 'https://dev.azure.com/mssonic/build/_apis/build/builds/'"${BUILD_CTC64}"'?api-version=6.0' | jq -r '.queueTime')"
	BUILD_GRC="$(curl -s 'https://dev.azure.com/mssonic/build/_apis/build/builds?definitions='"${DEFID_GRC}"'&branchName=refs/heads/'"${BRANCH}"'&$top=1&resultFilter=succeeded&api-version=6.0' | jq -r '.value[0].id')"
	BUILD_GRC_TS="$(curl -s 'https://dev.azure.com/mssonic/build/_apis/build/builds/'"${BUILD_GRC}"'?api-version=6.0' | jq -r '.queueTime')"
	BUILD_MRV="$(curl -s 'https://dev.azure.com/mssonic/build/_apis/build/builds?definitions='"${DEFID_MRV}"'&branchName=refs/heads/'"${BRANCH}"'&$top=1&resultFilter=succeeded&api-version=6.0' | jq -r '.value[0].id')"
	BUILD_MRV_TS="$(curl -s 'https://dev.azure.com/mssonic/build/_apis/build/builds/'"${BUILD_MRV}"'?api-version=6.0' | jq -r '.queueTime')"
	BUILD_NPH="$(curl -s 'https://dev.azure.com/mssonic/build/_apis/build/builds?definitions='"${DEFID_NPH}"'&branchName=refs/heads/'"${BRANCH}"'&$top=1&resultFilter=succeeded&api-version=6.0' | jq -r '.value[0].id')"
	BUILD_NPH_TS="$(curl -s 'https://dev.azure.com/mssonic/build/_apis/build/builds/'"${BUILD_NPH}"'?api-version=6.0' | jq -r '.queueTime')"

	#echo " [*] Last successful builds for \"${BRANCH}\":"
	#echo "     Broadcom: ${BUILD_BRCM}"
	#echo "     Mellanox: ${BUILD_MLNX}"
	#echo "     Virtual Switch: ${BUILD_VS}"

	ARTF_BRCM="$(curl -s 'https://dev.azure.com/mssonic/build/_apis/build/builds/'"${BUILD_BRCM}"'/artifacts?artifactName=sonic-buildimage.broadcom&api-version=5.1' | jq -r '.resource.downloadUrl')"
	ARTF_MLNX="$(curl -s 'https://dev.azure.com/mssonic/build/_apis/build/builds/'"${BUILD_MLNX}"'/artifacts?artifactName=sonic-buildimage.mellanox&api-version=5.1' | jq -r '.resource.downloadUrl')"
	ARTF_VS="$(curl -s 'https://dev.azure.com/mssonic/build/_apis/build/builds/'"${BUILD_VS}"'/artifacts?artifactName=sonic-buildimage.vs&api-version=5.1' | jq -r '.resource.downloadUrl')"
	ARTF_INNO="$(curl -s 'https://dev.azure.com/mssonic/build/_apis/build/builds/'"${BUILD_INNO}"'/artifacts?artifactName=sonic-buildimage.innovium&api-version=5.1' | jq -r '.resource.downloadUrl')"
	ARTF_BFT="$(curl -s 'https://dev.azure.com/mssonic/build/_apis/build/builds/'"${BUILD_BFT}"'/artifacts?artifactName=sonic-buildimage.barefoot&api-version=5.1' | jq -r '.resource.downloadUrl')"
	ARTF_CHE="$(curl -s 'https://dev.azure.com/mssonic/build/_apis/build/builds/'"${BUILD_CHE}"'/artifacts?artifactName=sonic-buildimage.cache&api-version=5.1' | jq -r '.resource.downloadUrl')"
	ARTF_CTC="$(curl -s 'https://dev.azure.com/mssonic/build/_apis/build/builds/'"${BUILD_CTC}"'/artifacts?artifactName=sonic-buildimage.centec&api-version=5.1' | jq -r '.resource.downloadUrl')"
	ARTF_CTC64="$(curl -s 'https://dev.azure.com/mssonic/build/_apis/build/builds/'"${BUILD_CTC64}"'/artifacts?artifactName=sonic-buildimage.centec-arm64&api-version=5.1' | jq -r '.resource.downloadUrl')"
	ARTF_GRC="$(curl -s 'https://dev.azure.com/mssonic/build/_apis/build/builds/'"${BUILD_GRC}"'/artifacts?artifactName=sonic-buildimage.generic&api-version=5.1' | jq -r '.resource.downloadUrl')"
	ARTF_MRV="$(curl -s 'https://dev.azure.com/mssonic/build/_apis/build/builds/'"${BUILD_MRV}"'/artifacts?artifactName=sonic-buildimage.marvell-armhf&api-version=5.1' | jq -r '.resource.downloadUrl')"
	ARTF_NPH="$(curl -s 'https://dev.azure.com/mssonic/build/_apis/build/builds/'"${BUILD_NPH}"'/artifacts?artifactName=sonic-buildimage.nephos&api-version=5.1' | jq -r '.resource.downloadUrl')"



echo "# Supported Platforms" > supported_devices_platforms.md

echo "#### Following is the list of platforms that supports SONiC." >> supported_devices_platforms.md
echo "| S.No | Vendor         | Platform       		| ASIC Vendor | Switch ASIC       | Port Configuration  	| Image                                                        |" >> supported_devices_platforms.md
echo "| ---- | -------------- | ----------- | ----------------- | ----------------------- | ------------------------------------------------------------ | ------------------------------------------------------------ |" >> supported_devices_platforms.md


# Set the name of the input JSON file
input_file="supported_devices_platforms.json"
# Read the JSON file into a variable
json_data=$(cat $input_file)
# Loop through the list of dictionaries
for row in $(echo "${json_data}" | jq -r '.[] | @base64'); do
    # Decode the base64-encoded row and parse as JSON
    _jq() {
        echo ${row} | base64 --decode | jq -r ${1}
    }
    # Print the values of some keys in the dictionary
    #echo "Serial_Num: $(_jq '.Serial_Num')"
    #echo "Vendor: $(_jq '.Vendor')"
    #echo "Platform: $(_jq '.Platform')"
    #echo "ASIC_Vendor: $(_jq 'ASIC_Vendor')"
	#echo "Switch_ASIC: $(_jq 'Switch_ASIC')"
	#echo "PortConfig: $(_jq '.PortConfig')"
    echo "|  $(_jq '.Serial_Num')   | $(_jq '.Vendor')    	| $(_jq '.Platform')    		| $(_jq '.ASIC_Vendor')    | $(_jq '.Switch_ASIC')           | $(_jq '.PortConfig')  | [SONiC-ONIE-Broadcom]($(echo "${ARTF_BRCM}" | sed 's/format=zip/format=file\&subpath=\/target\/sonic-broadcom.bin/')) |" >> supported_devices_platforms.md
done



	
done

git add test_supported_devices_platforms.md
git commit -m "latest links for sonic images in supported platform md file"
git push -f --set-upstream origin 
