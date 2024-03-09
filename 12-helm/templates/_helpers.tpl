{{/*
Expand the name of the chart.
*/}}
{{- define "wcg.name" -}}
{{- default .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}


