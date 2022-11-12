{{/* vim: set filetype=mustache: */}}

{{/*
Returns formatted remote path to openfga container image
*/}}
{{- define "openfga.image" -}}
{{ include "common.images.image" (dict "imageRoot" .Values.image "global" .Values.global) }}
{{- end -}}

{{/*
Returns formated remote path to openfga migration image
*/}}
{{- define "openfga.migrateJob.image" -}}
{{ include "common.images.image" (dict "imageRoot" .Values.migrateJob.image "global" .Values.global) }}
{{- end -}}

{{/*
Returns proper docker image registry secret name
*/}}
{{- define "openfga.imagePullSecrets" -}}
{{- include "common.images.pullSecrets" (dict "images" (list .Values.image .) "global" .Values.global) -}}
{{- end -}}

{{/*
Returns the name of the secret for database uri
*/}}
{{- define "openfga.databaseSecretName" -}}
    {{- default (printf "%s-postgres" (include "common.names.fullname" .)) (tpl .Values.externalDatabase.existingSecret $) -}}
{{- end -}}

{{/*
Returns the key in the secret for database uri
*/}}
{{- define "openfga.databaseSecretKey" -}}
{{- default "uri" (tpl .Values.externalDatabase.existingSecretKey $) -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
*/}}
{{- define "openfga.postgresql.fullname" -}}
{{- include "common.names.dependency.fullname" (dict "chartName" "postgresql" "chartValues" .Values.postgresql "context" $) -}}
{{- end -}}

{{/*
Returns the database username
*/}}
{{- define "openfga.databaseUser" -}}
{{- if .Values.postgresql.enabled -}}
    {{- if .Values.global.postgresql -}}
        {{- if .Values.global.postgresql.auth -}}
            {{- coalesce .Values.global.postgresql.auth.username .Values.postgresql.auth.username -}}
        {{- else -}}
            {{- .Values.postgresql.auth.username -}}
        {{- end -}}
    {{- else -}}
        {{- .Values.postgresql.auth.username -}}
    {{- end -}}
{{- else -}}
    {{- .Values.externalDatabase.user -}}
{{- end -}}
{{- end -}}

{{/*
Return the Database port
*/}}
{{- define "openfga.databasePort" -}}
{{- ternary 5432 .Values.externalDatabase.port .Values.postgresql.enabled -}}
{{- end -}}

{{/*
Return the Database database name
*/}}
{{- define "openfga.databaseName" -}}
{{- if .Values.postgresql.enabled -}}
    {{- if .Values.global.postgresql -}}
        {{- if .Values.global.postgresql.auth -}}
            {{- coalesce .Values.global.postgresql.auth.database .Values.postgresql.auth.database -}}
        {{- else -}}
            {{- .Values.postgresql.auth.database -}}
        {{- end -}}
    {{- else -}}
        {{- .Values.postgresql.auth.database -}}
    {{- end -}}
{{- else -}}
    {{- .Values.externalDatabase.database -}}
{{- end -}}
{{- end -}}

{{/*
Return the Database hostname
*/}}
{{- define "openfga.databaseHost" -}}
    {{- if eq .Values.postgresql.architecture "replication" -}}
        {{- ternary (include "openfga.postgresql.fullname" .) .Values.externalDatabase.host .Values.postgresql.enabled -}}-primary
    {{- else -}}
        {{- ternary (include "openfga.postgresql.fullname" .) .Values.externalDatabase.host .Values.postgresql.enabled -}}
    {{- end -}}
{{- end -}}

{{/*
Return the database password
*/}}
{{- define "openfga.databasePassword" -}}
    {{- if .Values.postgresql.enabled -}}
        {{- if .Values.global.postgresql -}}
            {{- if .Values.global.postgresql.auth -}}
                {{- coalesce .Values.global.postgresql.auth.password .Values.postgresql.auth.password -}}
            {{- else -}}
                {{- .Values.postgresql.auth.password -}}
            {{- end -}}
        {{- else -}}
            {{- .Values.postgresql.auth.password -}}
        {{- end -}}
    {{- else -}}
        {{- .Values.externalDtabase.password -}}
    {{- end -}}
{{- end -}}

{{/*
Returns the datastore URI
*/}}
{{- define "openfga.databaseUri" -}}
{{- if .Values.postgresql.enabled -}}
    {{- printf "postgres://%s:%s@%s:%v/%s" 
        (include "openfga.databaseUser" .)
        (include "openfga.databasePassword" .)
        (include "openfga.databaseHost" .)
        (include "openfga.databasePort" .)
        (include "openfga.databaseName" .)
    -}}
{{- else -}}
    {{- printf "postgres://%s:%s@%s:%v/%s" .Values.externalDatabase.user .Values.externalDatabase.password .Values.externalDatabase.host .Values.externalDatabase.port .Values.externalDatabase.database }}
{{- end -}}
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