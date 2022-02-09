{{- define "app.name" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create a service account name
*/}}
{{- define "sa.name" -}}
{{- $name := "default" -}}
{{- if .Values.serviceAccount }}
{{- if .Values.serviceAccount.create }}
{{- $name = default (include "app.name" .) .Values.serviceAccount.name -}}
{{- else -}}
{{- $name = default "default" .Values.serviceAccount.name -}}
{{- end -}}
{{- end -}}
{{- printf "%s" $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
