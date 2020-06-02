Class {
	#name : #RegistroExitosoComponent,
	#superclass : #AbstractUserComponent,
	#category : #'Bookflix-UI'
}

{ #category : #'as yet unclassified' }
RegistroExitosoComponent >> irLogin [

self call: LoginWithMoldComponent new.
self answer.
]

{ #category : #rendering }
RegistroExitosoComponent >> renderContentOn: aCanvas [
	self titleTop: aCanvas.
	aCanvas div
		with: [ aCanvas
				paragraph: 'El usuario se registro correctamente en el sistema'.
			aCanvas anchor
				callback: [ self irLogin ];
				with: 'Volver a iniciar sesión' ]
]

{ #category : #'as yet unclassified' }
RegistroExitosoComponent >> titleTop: aCanvas [
	 aCanvas div id: 'Bookflix';
		with: 'Bookflix'.
				aCanvas horizontalRule.
]
