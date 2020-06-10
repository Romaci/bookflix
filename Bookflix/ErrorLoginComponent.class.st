Class {
	#name : #ErrorLoginComponent,
	#superclass : #AbstractUserComponent,
	#instVars : [
		'user',
		'password'
	],
	#category : #'Bookflix-UI'
}

{ #category : #'as yet unclassified' }
ErrorLoginComponent >> irLoginUser [

self call: LoginWithMoldComponent new. 
]

{ #category : #rendering }
ErrorLoginComponent >> renderContentOn: aCanvas [
self titleTop: aCanvas.
		aCanvas div
		with: [ aCanvas 
				paragraph: 'El usuario y/o constraseña ingresados son incorrectos'.
	   
		aCanvas anchor
			callback: [self irLoginUser ];
			with: 'Volver a iniciar sesión'.].
]
