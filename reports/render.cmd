@echo off

del /q output\*.docx

pandoc --from=gfm --to=docx --reference-doc=reference.docx --resource-path=practice_01 -o output\practice_01.docx practice_01\report.md

explorer.exe output
