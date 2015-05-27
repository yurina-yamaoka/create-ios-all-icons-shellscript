#!/bin/sh
#このシェルスクリプトを実行した場所をカレントディレクトリにする（お約束）
cd `dirname $0`

# 出力ディレクトリの生成
outdir="ios_name"
mkdir -p $outdir

#----------------------------------------------------------------------
# iTunes Artwork アイコン
#----------------------------------------------------------------------

# iPhone6, iPhone6 Plus登場から、1024x1024が必須となりました。↓
# https://developer.apple.com/library/ios/documentation/UserExperience/Conceptual/MobileHIG/IconMatrix.html
# ですので、このスクリプトでは最低でも、512x512サイズのアイコン画像がないと処理を終了するように修正しました。

if [ -e "icon_1024x1024.png" ]; then
	sips -Z 512 icon_1024x1024.png --out icon_512x512.png
	BASE_FILE="icon_1024x1024.png"
else
	echo "iTunes Artworkに設定できる適当なサイズが見つかりません。\niPhone6, iPhone6 Plus登場から、1024x1024が必須となりました。"
	exit
fi

#----------------------------------------------------------------------
# アプリアイコン
#----------------------------------------------------------------------

# iPad Retina, iPad Retina(iOS 6.1 and Prior)
if [ -e ${BASE_FILE} ]; then
	sips -Z 152 ${BASE_FILE} --out icon_152x152.png
	# iPad Retina(iOS 6.1 and Prior)
	sips -Z 144 ${BASE_FILE} --out icon_144x144.png
fi
# iPhone Retina(iOS 6.1 and Prior)
if [ -e "icon_114x114.png" ]; then
	echo "icon_114x114.png はすでに存在しています。処理をスキップします。"
else
	sips -Z 114 ${BASE_FILE} --out icon_114x114.png
fi
# iPhone Non-Retina(iOS 6.1 and Prior) 
if [ -e "icon_57x57.png" ]; then
	echo "icon_57x57.png はすでに存在しています。処理をスキップします。"
else
	sips -Z 57 "icon_114x114.png" --out icon_57x57.png
fi
# iPad Non-Retina(iOS 6.1 and Prior)
if [ -e "icon_72x72.png" ]; then
	echo "icon_72x72.png はすでに存在しています。処理をスキップします。"
else
	sips -Z 72 "icon_144x144.png" --out icon_72x72.png
fi
# iPad Non-Retina
if [ -e "icon_76x76.png" ]; then
	echo "icon_76x76.png はすでに存在しています。処理をスキップします。"
else
	sips -Z 76 "icon_152x152.png" --out icon_76x76.png
fi
# iPhone Retina
if [ -e "icon_120x120.png" ]; then
	echo "icon_120x120.png はすでに存在しています。処理をスキップします。"
else
	sips -Z 120 ${BASE_FILE} --out icon_120x120.png
fi
# iPhone 6 Plus
if [ -e "icon_180x180.png" ]; then
	echo "icon_180x180.png はすでに存在しています。処理をスキップします。"
else
	sips -Z 180 ${BASE_FILE} --out icon_180x180.png
fi

#-----------------------------------
# Spotlight検索アイコン
#-----------------------------------

# iPhone 6 Plus 
if [ -e "icon_120x120.png" ]; then
	echo "icon_120x120.png はすでに存在しています。処理をスキップします。"
else
	sips -Z 120 ${BASE_FILE} --out icon_120x120.png
fi
# iPad Retina(iOS 6.1 and Prior) 
if [ -e "icon_100x100.png" ]; then
	echo "icon_100x100.png はすでに存在しています。処理をスキップします。"
else
	sips -Z 100 ${BASE_FILE} --out icon_100x100.png
fi
# iPad Non-Retina(iOS 6.1 and Prior)
if [ -e "icon_50x50.png" ]; then
	echo "icon_50x50.png はすでに存在しています。処理をスキップします。"
else
	sips -Z 50 "icon_100x100.png" --out icon_50x50.png
fi
# iPhone Retina、iPad Retina
if [ -e "icon_80x80.png" ]; then
	echo "icon_80x80.png はすでに存在しています。処理をスキップします。"
else
	sips -Z 80 ${BASE_FILE} --out icon_80x80.png
fi
# iPad Non-Retina
if [ -e "icon_40x40.png" ]; then
	echo "icon_40x40.png はすでに存在しています。処理をスキップします。"
else
	sips -Z 40 "icon_80x80.png" --out icon_40x40.png
fi
# iPhone Retina(iOS 6.1 and Prior)
if [ -e "icon_58x58.png" ]; then
	echo "icon_58x58.png はすでに存在しています。処理をスキップします。"
else
	sips -Z 58 ${BASE_FILE} --out icon_58x58.png
fi
# iPhone Non-Retina(iOS 6.1 and Prior)
if [ -e "icon_29x29.png" ]; then
	echo "icon_29x29.png はすでに存在しています。処理をスキップします。"
else
	sips -Z 29 "icon_58x58.png" --out icon_29x29.png
fi

#-----------------------------------
# 設定アイコン
#-----------------------------------

# iPhone 6 Plus
if [ -e "icon_87x87.png" ]; then
	echo "icon_87x87.png はすでに存在しています。処理をスキップします。"
else
	sips -Z 87 ${BASE_FILE} --out icon_87x87.png
fi

# iPhone Retina、iPad Retina
if [ -e "icon_58x58.png" ]; then
	echo "icon_58x58.png はすでに存在しています。処理をスキップします。"
else
	sips -Z 58 ${BASE_FILE} --out icon_58x58.png
fi

# iPhone Non-Retina(iOS 6.1 and Prior)、iPad Non-Retina
if [ -e "icon_29x29.png" ]; then
	echo "icon_29x29.png はすでに存在しています。処理をスキップします。"
else
	sips -Z 29 "icon_58x58.png" --out icon_29x29.png
fi

#-----------------------------------
# 生成した各サイズのアイコンを一括リネーム
#-----------------------------------
# App Storeアイコン
#-----------------------------------
cp -vf "icon_1024x1024.png" "${outdir}/iTunesArtwork@2x.png"
cp -vf "icon_512x512.png" "${outdir}/iTunesArtwork.png"

#-----------------------------------
# アプリアイコン
#-----------------------------------
# iPad第3世代
cp -vf "icon_144x144.png" "${outdir}/Icon-72@2x.png"
# iPad / iPad2 / iPad mini
cp -vf "icon_72x72.png" "${outdir}/Icon-72.png"
# iPhone4 以降
cp -vf "icon_114x114.png" "${outdir}/Icon@2x.png"
# iPhone3G / 3GS	
cp -vf "icon_57x57.png" "${outdir}/Icon.png"

#-----------------------------------
# アプリアイコン（iOS7）
#-----------------------------------
# iPhone4 以降
cp -vf "icon_120x120.png" "${outdir}/Icon-60@2x.png"
# iPad 第3世代
cp -vf "icon_152x152.png" "${outdir}/Icon-76@2x.png"
# iPad2 / iPad mini	
cp -vf "icon_76x76.png" "${outdir}/Icon-76.png"

#-----------------------------------
# アプリアイコン（iPhone6 Plus）
#-----------------------------------
# iPhone 6 Plusアイコン
cp -vf "icon_180x180.png" "${outdir}/Icon-60@3x.png"

#-----------------------------------
# 設定/Spotlight（iOS6以前）
#-----------------------------------
# iPad 第3世代
cp -vf "icon_100x100.png" "${outdir}/Icon-Small-50@2x.png"
#iPad / iPad2 / iPad mini
cp -vf "icon_50x50.png" "${outdir}/Icon-Small-50.png"
# Phone4以降、iPad 第3世代
cp -vf "icon_58x58.png" "${outdir}/Icon-Small@2x.png"
# iPhone3G / 3GS、iPad / iPad2 / iPad mini
cp -vf "icon_29x29.png" "${outdir}/Icon-Small.png"

#-----------------------------------
# 設定/Spotlight（iOS7）
#-----------------------------------
# Phone4 以降、iPad 第3世代
cp -vf "icon_80x80.png" "${outdir}/Icon-Small-40@2x.png"
# Pad2 / iPad mini
cp -vf "icon_40x40.png" "${outdir}/Icon-Small-40.png"

#-----------------------------------
# 設定/Spotlight（iPhone 6 Plus）
#-----------------------------------
# 設定
cp -vf "icon_120x120.png" "${outdir}/Icon-Small-40@3x.png"
# Spotlight
cp -vf "icon_87x87.png" "${outdir}/Icon-Small@3x.png"


