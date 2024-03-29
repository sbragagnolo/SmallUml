Class {
	#name : #ObjectNode,
	#superclass : #DiagramNode,
	#instVars : [
		'object'
	],
	#category : #'SUML-ObjectDiagramModel'
}

{ #category : #'as yet unclassified' }
ObjectNode class >> for: anObject [
	^self new object: anObject 
]

{ #category : #'as yet unclassified' }
ObjectNode class >> for: anObject named: objectName [
	^ (self named: objectName)
		object: anObject;
		yourself
]

{ #category : #'as yet unclassified' }
ObjectNode >> = anotherObject [
	^(self class = anotherObject class) and:[ self object = anotherObject object]
]

{ #category : #'as yet unclassified' }
ObjectNode >> connectToReferencesWithin: aDiagram [
	self allAttributeNames
		do: [ :variableName | 
			| newObjectNode |
			self
				connectTo: (aDiagram diagramNodeFor: (self variableNamed: variableName))
				using: (ReferenceRelationship new label: variableName) ]
]

{ #category : #'as yet unclassified' }
ObjectNode >> descriptionCodeForEdition [ 
	^super descriptionCodeForEdition , self relationshipsCode 
]

{ #category : #'as yet unclassified' }
ObjectNode >> hasA: anotherClassBox labeledAs: aLabel [
	self addRelationship: (Relationship associationRelationshipFrom: self to: anotherClassBox labeledAs: aLabel)
]

{ #category : #'as yet unclassified' }
ObjectNode >> hash [
	^self object hash
]

{ #category : #'as yet unclassified' }
ObjectNode >> label [
|stream|
stream := WriteStream on:''.
stream nextPutAll: self object printString.
^stream contents
]

{ #category : #accessing }
ObjectNode >> object [
	^ object
]

{ #category : #accessing }
ObjectNode >> object: anObject [
	object := anObject
]

{ #category : #accessing }
ObjectNode >> realDiagramNode [
	^self
]

{ #category : #'as yet unclassified' }
ObjectNode >> resetConnections [
	self relations: Set new.
]

{ #category : #accessing }
ObjectNode >> subject [
	^object
]

{ #category : #accessing }
ObjectNode >> updaterClass [
	^ObjectNodeUpdater 
]

{ #category : #'as yet unclassified' }
ObjectNode >> variableNamed: aVariableName [
	^self object instVarNamed: aVariableName 
]

{ #category : #'as yet unclassified' }
ObjectNode >> variableNames [ 
	^self object class instVarNames
]

{ #category : #'as yet unclassified' }
ObjectNode >> view [
	^ObjectNodeMorph for: self
]
