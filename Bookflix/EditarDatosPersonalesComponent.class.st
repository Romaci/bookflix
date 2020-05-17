Class {
	#name : #EditarDatosPersonalesComponent,
	#superclass : #WAComponent,
	#instVars : [
		'nombre',
		'apellido',
		'email'
	],
	#category : #'Bookflix-UI'
}

{ #category : #accessing }
EditarDatosPersonalesComponent >> apellido:unApe [

apellido:=unApe.
]

{ #category : #'as yet unclassified' }
EditarDatosPersonalesComponent >> cancelar [
self answer 
]

{ #category : #accessing }
EditarDatosPersonalesComponent >> email:unEmail [

email:=unEmail .
]

{ #category : #'as yet unclassified' }
EditarDatosPersonalesComponent >> guardar [

	nombre ifNotNil: [self session getUser nombre: nombre.].

	apellido ifNotNil: [self session getUser apellido: apellido.].
	email ifNotNil: [self session getUser mail: email.].

	self answer
]

{ #category : #accessing }
EditarDatosPersonalesComponent >> nombre:unNombre [

nombre:=unNombre . 
]

{ #category : #rendering }
EditarDatosPersonalesComponent >> renderContentOn: aCanvas [

aCanvas 
	form: [aCanvas 
				paragraph: [ aCanvas label: 'Nombre'.
					aCanvas textInput 
						callback: [ :valor| self nombre:valor];
					with: ''.].
			
	
			aCanvas paragraph: [ aCanvas label: 'Apellido '.
					aCanvas textInput 
					callback: [ :valor| self apellido:valor];
					with: ''.].
				
		  aCanvas paragraph: [ aCanvas label: 'Email'.
					aCanvas textInput  
					callback: [ :valor| self email:valor];
					with: ''.].

		aCanvas button
			callback: [self guardar ];
			with: 'Guardar'.
		
		aCanvas button
			callback: [self cancelar ];
			with: 'Cancelar'.
		
	].





]
