Class {
	#name : #DiagramNodeMorph,
	#superclass : #Morph,
	#traits : 'TConnectableShape',
	#classTraits : 'TConnectableShape classTrait',
	#instVars : [
		'container',
		'diagramNode',
		'diagramEventHandler'
	],
	#category : #'SUML-DiagramDrawing'
}

{ #category : #'as yet unclassified' }
DiagramNodeMorph >> adjustPosition [

	(self position = diagramNode position)
		ifTrue:[self position: owner position + diagramNode position]
]

{ #category : #'as yet unclassified' }
DiagramNodeMorph >> connectTo: anotherBox using: aConnection [
	| origin destination |
	origin := SingleConnectionPoint new.
	destination := SingleConnectionPoint new.
	self connectableBounds addConnectionPoint: origin thatConnectsTo: anotherBox.
	anotherBox connectableBounds addConnectionPoint: destination thatConnectsTo:  self.
	self connectableBounds changed.
	anotherBox connectableBounds changed.

	self connectableBounds addMorph: aConnection  .
	anotherBox connectableBounds addMorph: aConnection.
	aConnection from: origin to: destination.
	self connectableBounds  updateView  .
	anotherBox connectableBounds  updateView.
]

{ #category : #accessing }
DiagramNodeMorph >> connections [ 
	^self connectableBounds connections 
]

{ #category : #'as yet unclassified' }
DiagramNodeMorph >> diagramNode [
	^diagramNode 
]

{ #category : #'as yet unclassified' }
DiagramNodeMorph >> diagramNode: aDiagramNode [
	diagramNode  := aDiagramNode.
	
	diagramNode  ifNotNil: [diagramNode  removeDependent: self].
	aDiagramNode ifNotNil: [aDiagramNode addDependent: self].
	
	self position: diagramNode position
]

{ #category : #'as yet unclassified' }
DiagramNodeMorph >> eventHandler [ 
	^diagramEventHandler 
]

{ #category : #'dragging-dropping' }
DiagramNodeMorph >> initialize [ 
	super initialize.
	diagramEventHandler  := DiagramNodeEventHandler new passenger: self.
]

{ #category : #'as yet unclassified' }
DiagramNodeMorph >> keyDown: evt [
	self eventHandler keyDown: evt.
]

{ #category : #'as yet unclassified' }
DiagramNodeMorph >> mouseDown: evt [
	self eventHandler mouseDown: evt
]

{ #category : #accessing }
DiagramNodeMorph >> relations [ 
	^self connections collect:[:conn | conn target]
]

{ #category : #updating }
DiagramNodeMorph >> resetBoundings [
	self connectableBounds resetConnectionPoints
]

{ #category : #'as yet unclassified' }
DiagramNodeMorph >> step [
	"self updateLayout; updateBounds "
]

{ #category : #'as yet unclassified' }
DiagramNodeMorph >> update: aParameter [
	(aParameter = #position)
		ifTrue: [self position: diagramNode position.
				owner ifNotNil:[ owner updateDescriptionCode].].
	(aParameter = #view)
		ifTrue: [self updateLayout.
				owner ifNotNil:[owner update]].
]

{ #category : #'as yet unclassified' }
DiagramNodeMorph >> updateConnections [ 
	self connectableBounds updateConnections.
]

{ #category : #'as yet unclassified' }
DiagramNodeMorph >> updateLayout [

	self connectableBounds updateLayout.
]
