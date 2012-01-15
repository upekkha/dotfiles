# LaTeXmk configuration file

# Main command line options
# -pdf	: generate pdf using pdflatex
# -pv	: run file previewer
# -pvc	: run file previewer and continually recompile on change

# Use default pdf viewer (Skim)
$pdf_previewer="open";

# Also remove pdfsync files on clean
$clean_ext="pdfsync";
