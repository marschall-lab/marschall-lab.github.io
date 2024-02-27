#!/bin/awk -f
# kludgefactory.  usage: $0 [BIBFILE..]
function datefmt(ref,	d){
	if(da[ref] != ""){
		gsub("\\.", "-", da[ref])
		d = da[ref]
	}else{
		if(mm[ref] ~ /[Jj]an/) mm[ref] = "01"
		else if(mm[ref] ~ /[Ff]eb/) mm[ref] = "02"
		else if(mm[ref] ~ /[Mm]ar/) mm[ref] = "03"
		else if(mm[ref] ~ /[Aa]pr/) mm[ref] = "04"
		else if(mm[ref] ~ /[Mm]ay/) mm[ref] = "05"
		else if(mm[ref] ~ /[Jj]un/) mm[ref] = "06"
		else if(mm[ref] ~ /[Jj]ul/) mm[ref] = "07"
		else if(mm[ref] ~ /[Aa]ug/) mm[ref] = "08"
		else if(mm[ref] ~ /[Ss]ep/) mm[ref] = "09"
		else if(mm[ref] ~ /[Oo]ct/) mm[ref] = "10"
		else if(mm[ref] ~ /[Nn]ov/) mm[ref] = "11"
		else if(mm[ref] ~ /[Dd]ec/) mm[ref] = "12"
		d = yy[ref] "-" mm[ref]
	}
	return d
}
function commanames(s,	m, a, b, c, i, j){
	split(s, a, " and ")
	m = ""
	for(i=1; i<=length(a); i++){
		if(a[i] ~ /Mari, Rebecca Serra/)
			a[i] = "Serra Mari, Rebecca"
		split(a[i], b, " ?, ")
		if(m != "")
			m = m ", "
		m = m b[1] " "
		split(b[2], c, " ")
		for(j=1; j<=length(c); j++)
			m = m substr(c[j], 1, 1)
		if(i == 1)
			first = b[1]
	}
	return m
}
function namefmt(s,	m, a, b, c, i, j){
	if(index(s, ",") != 0)
		return commanames(s)
	split(s, a, " and ")
	m = ""
	for(i=1; i<=length(a); i++){
		split(a[i], b, " ")
		if(m != "")
			m = m ", "
		j = index(a[i], " ")
		m = m substr(a[i], j+1) " " substr(a[i], 1, 1)
		if(i == 1)
			first = substr(a[i], 1, j-1)
	}
	return m
}
$1 ~ /^@/{
	ref++
}
{
	gsub("=[ \\t]*{|[ \\t]*},?$", "")
	gsub("[{}]", "")
	# non exhaustive
	gsub("\\\\\"o", "ö")
	gsub("\\\\\"u", "ü")
	gsub("\\\\\"a", "ä")
	gsub("\\\\\\'e", "é")
	gsub("\\\\\\'n", "ń")
	gsub("\\\\\\'c", "ć")
	gsub("\\\\o", "ø")
}
$1 ~ /^[Tt]itle/{ $1 = ""; sub("^[ \t]+", ""); tl[ref] = "\"" $0 "\"" }
$1 ~ /^[Aa]uthor/{ $1 = ""; sub("^[ \t]+", ""); au[ref] = $0 }
$1 ~ /^[Dd]oi/{ $1 = ""; sub("^[ \t]+", ""); if($0 !~ /^http/) $0 = "https://doi.org/" $0; tx[ref] = $0 }
$1 ~ /^[Pp]mid/{ $1 = ""; sub("^[ \t]+", ""); pb[ref] = $0 }
$1 ~ /^[Jj]ournal/{ $1 = ""; sub("^[ \t]+", ""); jo[ref] = $0 }
$1 ~ /^[Bb]ooktitle/{ $1 = ""; sub("^[ \t]+", ""); bo[ref] = $0 }
$1 ~ /^[Tt]imestamp/{ $1 = ""; sub("^[ \t]+", ""); da[ref] = $0 }
$1 ~ /^[Yy]ear/{ $1 = ""; sub("^[ \t]+", ""); yy[ref] = $0 }
$1 ~ /^[Mm]onth/{ $1 = ""; sub("^[ \t]+", ""); mm[ref] = $0 }
END{
	for(i in tl){
		a = namefmt(au[i])
		d = datefmt(i)
		f = d "-" first ".yml"
		print "title:", tl[i] >f
		print "authors:", a >>f
		print "text:", tx[i] >>f
		print "date: \"" d "\"" >>f
		print "journal:", bo[i] != "" ? bo[i] : jo[i] >>f
		print "pubmed:", pb[i] >>f
		close(f)
	}
}
