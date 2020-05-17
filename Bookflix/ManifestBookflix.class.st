"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestBookflix,
	#superclass : #PackageManifest,
	#category : #'Bookflix-Manifest'
}

{ #category : #'code-critics' }
ManifestBookflix class >> ruleRBSendsUnknownMessageToGlobalRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#SistemaBookflix #registrarCuentaDe:conNombre:conApellido:conMail:yPass: #false)) #'2020-05-14T00:37:15.775385-03:00') #(#(#RGClassDefinition #(#SistemaBookflix)) #'2020-05-14T00:37:19.198385-03:00') )
]

{ #category : #'code-critics' }
ManifestBookflix class >> ruleRBSentNotImplementedRuleV1FalsePositive [
	^ #(#(#(#RGPackage #(#Bookflix)) #'2020-05-16T02:08:09.03092-03:00') )
]
