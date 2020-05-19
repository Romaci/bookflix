"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestBookflix,
	#superclass : #PackageManifest,
	#category : #'Bookflix-Manifest'
}

{ #category : #'code-critics' }
ManifestBookflix class >> ruleRBLongMethodsRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#RegistroComponent #formularioRegistro: #false)) #'2020-05-18T18:56:48.158431-03:00') )
]
