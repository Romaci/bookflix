Class {
	#name : #ErrorLoginAdminComponent,
	#superclass : #AbstractAdminComponent,
	#instVars : [
		'user',
		'password'
	],
	#category : #'Bookflix-UI'
}

{ #category : #'as yet unclassified' }
ErrorLoginAdminComponent >> irLoginAdmin [

self call: LoginAdminWithMoldComponent new. 
]

{ #category : #rendering }
ErrorLoginAdminComponent >> renderContentOn: aCanvas [
self titleTop: aCanvas.
aCanvas div
		with: [ aCanvas 
				paragraph: 'El usuario y/o constraseña ingresados son incorrectos'.
	   
		aCanvas anchor
			callback: [self irLoginAdmin ];
			with: 'Volver a iniciar sesión'.].  
]

{ #category : #'as yet unclassified' }
ErrorLoginAdminComponent >> titleTop: aCanvas [
	aCanvas div
		id: 'BookflixAdmin';
		with: [ aCanvas text: 'Bookflix' ].
		aCanvas break.
		aCanvas horizontalRule 
]
