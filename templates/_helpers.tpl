{{- define "common.env" }}
- name: SPACE_INST
  value: {{.Values.global.space_inst}}
- name: POD_IP
  valueFrom:
    fieldRef:
      apiVersion: v1
      fieldPath: status.podIP
- name: HOST_IP
  valueFrom:
    fieldRef:
      apiVersion: v1
      fieldPath: status.hostIP
{{- end }}

{{- define "common.volumes" }}
volumes:
- name: data
{{- if .Values.persistence.enabled }}
  persistentVolumeClaim:
    claimName: {{ .Release.Name }}
{{- else }}
  emptyDir: {}
{{- end }}
- name: cache
  emptyDir: {}
{{- end }}
