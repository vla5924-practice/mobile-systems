@echo off

del /q output\*.docx

pandoc --from=gfm --to=docx --reference-doc=reference.docx --resource-path=practice_01 -o output\practice_01.docx practice_01\README.md
pandoc --from=gfm --to=docx --reference-doc=reference.docx --resource-path=practice_02 -o output\practice_02.docx practice_02\README.md

explorer.exe output
