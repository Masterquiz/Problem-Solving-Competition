d test name;inps;outs;fn;i;out;linps;r;adj
 ⍝ name: Function name
 ⍝ d: Is the function dyadic?

 ⍝ User input: First inputs, after outputs
 adj←{'│'⎕R')('⊢('('∘,,∘')')¨'-'(≠⊆⊢)⍵}

 ⍞←'Enter right inputs: ' ⋄ inps←20↓adj⍞
 linps←' '⍴⍨⍴inps ⍝ Left input
 :If d
     ⍞←'Enter left inputs: ' ⋄ linps←19↓adj⍞
 :EndIf
 ⍞←'Enter outputs: ' ⋄ outs←15↓adj⍞

 ⍝ Test cases separated with '-'
 fn←⊂'test_ ← {'
 fn,←⊂'⎕CT←1E¯10' ⍝ Manage floating comparison
 fn,←⊂'Assert←{⍺←''Assertion failure'' ⋄ 0∊⍵:⍺ ⎕SIGNAL 8 ⋄ shy←0}'
 :For i :In ⍳≢inps
     fn,←⊂∊'Assert ',(i⊃outs),' ≡ ',(i⊃linps),name,' ',(i⊃inps),':'
 :EndFor
 fn,←⊂'''Test passed'''
 fn,←⊂'}'
 ⎕FX fn ⍝ Construct the function
 ⍞←' '
 ⍎'test_ ⍬'
