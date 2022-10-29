{{/* vim: set filetype=mustache: */}}

{{/*
Returns formatted remote path to openfga container image
*/}}
{{- define "openfga.image" -}}
{{ include "common.images.image" (dict "imageRoot" .Values.image "global" .Values.global) }}
{{- end -}}

{{/*
Returns proper docker image registry secret name
*/}}
{{- define "openfga.imagePullSecrets" -}}
{{- include "common.images.pullSecrets" (dict "images" (list .Values.image .) "global" .Values.global) -}}
{{- end -}}