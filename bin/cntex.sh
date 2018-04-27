#!/bin/sh 

# 该命令替换tex文件的document的begin和end，使LaTeX支持中文。
# 使用该命令主要是为了解决doxygen生成的refman.tex不支持中文的问题。
# 如下使用即可使doxygen生成的LaTeX支持中文。
# cntex refman.tex

sed -i -e 's,begin{document},usepackage{CJKutf8}\n\\begin{document}\n\\begin{CJK}{UTF8}{gbsn},' ${1}
sed -i -e 's,end{document},end{CJK}\n\\end{document},' ${1}
