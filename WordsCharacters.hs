module WordsCharacters where

import Data.Char

import PGF
import System.Environment.FindBin

-- path = getProgPath
-- file = path >>= \p -> return ( (++) p "/Happier.pgf")
-- gr = file >>= \f -> return ( readPGF f )
gr = readPGF "/home/drbean/GF/gf-contrib/drbean/conversation/learning/method/Method.pgf"

cat2funs :: String -> IO [CId]
cat2funs cat = do
	gr' <- gr
	let fs = functionsByCat gr' (mkCId cat)
	let ws = filter (isLower . head . showCId) fs
	let is = map (reverse . dropWhile (\x ->  (==) x '_' || isUpper x || isNumber x) . reverse .showCId ) ws
	return (map mkCId is )

gfWords :: [(String, IO [CId])]
gfWords = [
	("A",a)
	, ("Adv",adv)
	-- , ("Aux",aux)
	, ("Conj",conj)
	, ("Det",det)
	, ("N",n)
	, ("CN",cn)
	, ("PN",pn)
	, ("Pron",pron)
	, ("Prep",prep)
	-- , ("Rel",rel)
	, ("Tag",tag)
	, ("V",v)
	, ("V2",v2)
	, ("V3",v3)
	, ("VV",vv)
	, ("VS",vs)
	, ("V2A",v2a)
	]

posName :: String -> String
posName "A"	= "Adjective"
posName "Adv"	= "Adverb"
posName "Aux"	= "Auxiliary"
posName "Conj"	= "Conjunction"
posName "Det"	= "Determiner"
posName "N"	= "Uncount Noun"
posName "CN"	= "Count Noun"
posName "PN"	= "Proper Noun"
posName "Pron"	= "Pronoun"
posName "Prep"	= "Preposition"
posName "Rel"	= "Relative Pronoun"
posName "Tag"	= "Question Tag"
posName "V"	= "Verb"
posName "V2"	= "Verb + object"
posName "V3"	= "Verb + obj1 + obj2"
posName "VV"	= "Verb + verb"
posName "VS"	= "Verb + sentence"
posName "V2S"	= "Verb + object + sentence"
posName "V2A"	= "Verb + object + adjective"


a	= cat2funs "AP"
adv	= cat2funs "Adv"
conj	= cat2funs "Conj"
det	= cat2funs "Det"
n	= cat2funs "N"
cn	= cat2funs "CN"
pn	= cat2funs "PN"
prep	= cat2funs "Prep"
pron	= cat2funs "NP"
v	= cat2funs "V"
v2	= cat2funs "V2"
v3	= cat2funs "V3"
vv	= cat2funs "VV"
vs	= cat2funs "VS"
v2a	= cat2funs "V2A"
tag = return ( map mkCId tags )





aux = [
	"doesn't"
	, "don't"
	, "does"
	, "do"
	, "is"
	, "are"
	, "isn't"
	, "aren't"
	, "would"
	, "should"
	]
	

rel = [


	]

tags = [
	"doesn't he"
	, "doesn't she"
	, "doesn't it"
	, "don't they"
	, "does he"
	, "does she"
	, "does it"
	, "do they"
	, "isn't he"
	, "isn't she"
	, "isn't it"
	, "aren't they"
	, "is he"
	, "is she"
	, "is it"
	, "are they"
	]

{-

about	: Prep;
accent	: CN;
add	: V3;
always	: Adv;
as
ask	: V2Q;
at	: Prep;
at least	: Predet;
before	: Subj;
believe	: VS;
best	: Adv;
by	: Prep;
by heart	: Adv;
card	: CN;
category	: CN;
CD	: CN;
come across	: V;
computer	: CN;
down
English	: PN;
every	: Det;
example	: CN;
go through	: NP -> VP;
go to sleep	: V;
improve	: V2;
in	: Prep;
in common	: Adv;
include	: V2;
information	: N2;
into	: Prep;
keep	: V2;
Kelly	: PN;
key	: AP;
language	: CN;
learn	: V2;
learn	: V;
list	: CN;
listen	: V2;
look	: V2;
Manny	: PN;
meaning	: CN;
memorize	: V2;
new	: AP;
night	: CN;
noun	: CN;
often	: Adv;
on	: Prep;
one	: Det;
only	: AP;
or so	: Postdet;
organize	: V2;
organize	: V3;
other	: AP;
paper	: N;
piece	: N2;
put	: V;
record	: N2;
room	: CN;
say	: VS;	: CN;
sentence	: CN;
side	: CN;
spare time	: N;
stick	: V3;
study	: V2;
study card	: CN;
to	: Prep;
time	: N;
until	: Subj;
use	: V2;
verb	: CN;
vocabulary	: N;
Wanda	: PN;
way	: N2;
week	: CN;
when	: Subj;
whenever	: Subj;
whether	: Subj;
with	: Prep;
Won-gyu	: PN;
word	: CN;
write	: V2;

-}

-- vim: set ts=2 sts=2 sw=2 noet:
