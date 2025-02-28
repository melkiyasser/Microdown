"
Microdown supports mathematical expressions in text as in LaTeX, e.g. `$ 1 + 2 $`. Each exporter is then responsible for mapping the content to the correct output. For PDF based on LaTeX, `mathInlineBlock` can contain LaTeX. For HTML, we expect the same using the corresponding math library in JS.

Here are several examples:

#### Example 1
Code: `$V_i = C_0 - C_3$`

$V_i = C_0 - C_3$

#### Example 2
Code: `$a^2 + b^2 = c^2$`

$a^2 + b^2 = c^2$

#### Example 3
Code: `$\sin(x) = \sum_{n=0}^{\infty} \frac{(-1)^{n}x^{2n+1}}{(2n+1)!}$`

$\sin(x) = \sum_{n=0}^{\infty} \frac{(-1)^{n}x^{2n+1}}{(2n+1)!}$

#### Example 4
Code: `$f(a) = \frac{1}{2\pi i} \oint_{\gamma} \frac{f(z)}{z - a} dz$`

$f(a) = \frac{1}{2\pi i} \oint_{\gamma} \frac{f(z)}{z - a} dz$
"
Class {
	#name : 'MicMathInlineBlock',
	#superclass : 'MicUnEvaluatedBlock',
	#category : 'Microdown-Model',
	#package : 'Microdown',
	#tag : 'Model'
}

{ #category : 'accessing' }
MicMathInlineBlock class >> closingDelimiter [

 	^ MathMarkup
]

{ #category : 'accessing' }
MicMathInlineBlock class >> openingDelimiter [

 	^ MathMarkup
]

{ #category : 'visiting' }
MicMathInlineBlock >> accept: aVisitor [

	^ aVisitor visitMathInline: self
]
