transporter
saveWithTransporter
	"Will save the package in file-out format using the Transporter infrastructure"
	self transporter ifNotNilDo: [:transporter | transporter saveNoPopup ].