Class {
	#name : #UseRelationship,
	#superclass : #InstanceRelationship,
	#category : #'SUML-ClassDiagramModel'
}

{ #category : #'as yet unclassified' }
UseRelationship >> arrow [ 
	^UMLConnection newInstanceUse
]

{ #category : #'as yet unclassified' }
UseRelationship >> selector [
	^self oneToMany ifTrue:['usesLotsOf:'] ifFalse:['usesA:']
]

{ #category : #'as yet unclassified' }
UseRelationship >> writeDescriptionOn: aStream [
	aStream nextPutAll: self originDiagramNode variableNameForDescriptionCode , ' ', self selector , self destinationDiagramNode variableNameForDescriptionCode,'.'.
]
