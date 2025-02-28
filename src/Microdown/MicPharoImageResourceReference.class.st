"
I am a reference to an image or microdown resource in the Pharo image.

I follow the URI scheme `pharo:///class/selector/arg1/arg2`. My intended use is to give access to the many icons in pharo using: `pharo:///Object/iconNamed:/nameOfIcon`. 

Examples:
- abstract: ![](pharo:///Object/iconNamed:/abstract)
- bitbucket: ![](pharo:///Object/iconNamed:/bitbucket)
- thumbsUp: ![](pharo:///Object/iconNamed:/thumbsUp)

## Restrictions
- Only class methods can be invoked
- Only string arguments can be passed
"
Class {
	#name : 'MicPharoImageResourceReference',
	#superclass : 'MicAbsoluteResourceReference',
	#category : 'Microdown-Core',
	#package : 'Microdown',
	#tag : 'Core'
}

{ #category : 'instance creation' }
MicPharoImageResourceReference class >> handlesUriScheme: scheme [
	^ scheme = 'pharo'
]

{ #category : 'accessing' }
MicPharoImageResourceReference >> binaryReadStream [
	"I am not needed, I implement loadImage directly"
	^ self shouldBeImplemented
]

{ #category : 'accessing' }
MicPharoImageResourceReference >> contents [
	"I am not needed, I implement loadMicrodown directly"
	^ self perform
]

{ #category : 'loading' }
MicPharoImageResourceReference >> loadImage [
	"Assume the method just returns a form"
	^ self perform
]

{ #category : 'loading' }
MicPharoImageResourceReference >> loadMicrodown [
	"Assume the method just returns a document"
	^ self perform
]

{ #category : 'private' }
MicPharoImageResourceReference >> perform [
	"I assume the uri to have the form: 'pharo:///class/selector:/arg1/arg2"
	| class selector size args |
	class := self class environment at: uri segments first asSymbol.
	selector := uri segments second asSymbol.
	args := (size := uri segments size) > 2
		        ifTrue: [ (uri segments copyFrom: 3 to: size) asArray ]
		        ifFalse: [ #(  ) ].
	^ class perform: selector withArguments: args
]
