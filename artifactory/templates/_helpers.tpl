{{- define "app.labels" }}
app: {{ .Chart.Name }}
id: {{ .Values.id | quote }}
version: {{ .Chart.Version }}
{{- end }}

{{- define "app.name" -}}
{{- printf "%s-%s" .Chart.Name .Values.id }}
{{- end -}}

{{- define "app.selector" }}
app: {{ .Chart.Name  }}
id: {{ .Values.id  | quote }}
{{- end }}

{{- define "app.host_affinity" }}
podAntiAffinity:
  requiredDuringSchedulingIgnoredDuringExecution:
  - labelSelector:
      matchExpressions:
      - key: app
        operator: In
        values:
        - {{ .Chart.Name }}
      - key: id
        operator: In
        values:
        - {{ .Values.id | quote }}
    topologyKey: kubernetes.io/hostname
{{- end }}
