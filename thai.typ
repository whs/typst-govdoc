#let thai(body) = {
	set text(
		font: ("TH Sarabun New", "TH SarabunPSK", "Laksaman", "Angsana New", "AngsanaUPC", "Waree", "Noto Serif"),
		size: 16pt,
		lang: "th",
		region: "TH",
	)
	body
}
#let thnum(num) = str(num)
	.replace("0", "๐")
	.replace("1", "๑")
	.replace("2", "๒")
	.replace("3", "๓")
	.replace("4", "๔")
	.replace("5", "๕")
	.replace("6", "๖")
	.replace("7", "๗")
	.replace("8", "๘")
	.replace("9", "๙")
