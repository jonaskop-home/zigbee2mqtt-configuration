{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "zigbee2mqtt.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "zigbee2mqtt.labels" -}}
helm.sh/chart: {{ include "zigbee2mqtt.chart" . }}
{{ include "zigbee2mqtt.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "zigbee2mqtt.selectorLabels" -}}
app.kubernetes.io/name: {{ .Chart.Name }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Container image
*/}}
{{- define "zigbee2mqtt.image" -}}
{{- $registryName := .Values.image.registry -}}
{{- $repositoryName := .Values.image.repository -}}
{{- $tag := .Values.image.tag | default .Chart.Version -}}
{{- printf "%s%s%s%s%s" $registryName "/" $repositoryName ":" $tag -}}
{{- end }}