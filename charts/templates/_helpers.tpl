{{/*
Return the name of the chart
*/}}
{{- define "user-management-new.Name" -}}
{{ .Chart.Name }}
{{- end }}

{{/*
Return the fullname for the release
*/}}
{{- define "user-management-new.fullname" -}}
{{ .Release.Name }}-{{ .Chart.Name }}
{{- end }}
