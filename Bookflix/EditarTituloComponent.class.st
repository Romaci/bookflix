Class {
	#name : #EditarTituloComponent,
	#superclass : #WAComponent,
	#instVars : [
		'model',
		'titulo',
		'libro',
		'errorMessage'
	],
	#category : #'Bookflix-UI'
}

{ #category : #'as yet unclassified' }
EditarTituloComponent >> cancelar [
self answer 
]

{ #category : #accessing }
EditarTituloComponent >> formularioRegistro: aCanvas [

aCanvas 
	form: [aCanvas 
				paragraph: [ aCanvas label: 'Título'.
					aCanvas break.
					aCanvas textInput 
						callback: [ :valor| self titulo:valor];
					with: ''.].
			

		aCanvas button
			callback: [self guardar ];
			with: 'Guardar'.
		
		aCanvas button
			callback: [self cancelar ];
			with: 'Cancelar'.
		
	].
]

{ #category : #'as yet unclassified' }
EditarTituloComponent >> guardar [

	self libro titulo: titulo. 

	self answer
	

]

{ #category : #initialization }
EditarTituloComponent >> initialize [
	super initialize. 
]

{ #category : #accessing }
EditarTituloComponent >> libro [

^libro
]

{ #category : #accessing }
EditarTituloComponent >> model [ 
^ SistemaBookflix  soleInstance 
]

{ #category : #rendering }
EditarTituloComponent >> renderContentOn: aCanvas [
self titleTop: aCanvas.
aCanvas 
	form: [aCanvas 
				paragraph: [ aCanvas label: 'Título'.
					aCanvas textInput 
						callback: [ :valor| self titulo:valor];
					with: ''.].
			

		aCanvas button
			callback: [self guardar ];
			with: 'Guardar'.
		
		aCanvas button
			callback: [self cancelar ];
			with: 'Cancelar'.
		
	].
			aCanvas div
				id: 'mensajeError';
				with: [ errorMessage do: [ :each | aCanvas paragraph: each ] ] 
]

{ #category : #hooks }
EditarTituloComponent >> style [
	^ ' body { font-family: arial; text-decoration: strong; padding: 5px 20px 20px 20px; }
	.panel {  padding: 40px; box-shadow: 0 6px 10px 0 rgba(0,0,0,0.24)  }
	#formLogin { display: flex; flex-direction: column; align-items: center; justify-content: center;  }
	#pieDeRespuesta{text-align: center}
	#Bookflix { text-align: left; color: darkred; font-family: arial; font-size: 60px;} 
	#respuesta { text-align: center; }
	a {color:red} 
	#mensajeError { text-aling:center; color:red}
	#logout { text-align: right; padding: 6px 14px; float: right}
	#usuario { text-align: right; padding: 6px 14px; float: left; padding: 0px; color: ForestGreen; }
	button { background-color: darkred; border: none; color: white; padding: 10px 24px; text-align: center; text-decoration: 	none; display: inline-block; font-size: 16px; margin: 4px 2px;  border-radius: 8px; -webkit-transition-duration: 0.4s; 	transition-duration: 0.4s; cursor: pointer;}
	button:hover {background-color: black; color: white; box-shadow: 0 6px 10px 0 rgba(0,0,0,0.24), 0 17px 50px 0 	rgba(0,0,0,0.19);
	#formLogin { display: flex; flex-direction: column; align-items: center; justify-content: center;  }'
]

{ #category : #'as yet unclassified' }
EditarTituloComponent >> titleTop: aCanvas [
	 aCanvas div id: 'Bookflix';
		with: 'Bookflix'
]

{ #category : #accessing }
EditarTituloComponent >> titulo:unTitulo [

titulo:=unTitulo .
]

{ #category : #'as yet unclassified' }
EditarTituloComponent >> tituloDe:unLibro [

libro:=unLibro. 
]
