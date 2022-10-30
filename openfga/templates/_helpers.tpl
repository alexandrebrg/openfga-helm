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

{{/*
Returns the name of the secret for database password 
*/}}
{{- define "openfga.databaseSecretName" -}}
{{- default (printf "%s-postgres" (include "common.names.fullname" .)) (tpl .Values.externalDatabase.existingSecret $) -}}
{{- end -}}

{{/*
Returns the key in the secret for database password 
*/}}
{{- define "openfga.databaseSecretKey" -}}
{{- default "password" (tpl .Values.externalDatabase.existingSecretPasswordKey $) -}}
{{- end -}}

{{/*
Returns the datastore URI
*/}}
{{- define "openfga.databaseUri" -}}
{{- printf "postgres://%s:%s@%s:%v/%s" .Values.externalDatabase.user .Values.externalDatabase.password .Values.externalDatabase.host .Values.externalDatabase.port .Values.externalDatabase.database }}
{{- end -}}

{{/*
Create the name of the service account to use
*/}}
{{- define "openfga.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
    {{ default (include "common.names.fullname" .) .Values.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.serviceAccount.name }}
{{- end -}}
{{- end -}}