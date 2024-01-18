#!/bin/bash

# Проверка, установлен ли yq
if ! command -v yq &> /dev/null; then
    echo "Error: yq is not installed. Please install it first."
    exit 1
fi

# Имя файла YAML
yaml_file="cv.yaml"

# Имя файла JSON (можно настраивать)
json_file="cv.json"

# Конвертация YAML в JSON
yq eval-all 'select(fileIndex == 0)' "$yaml_file" > "$json_file"

# Подтверждение успешного завершения
echo "Conversion from YAML to JSON completed. Output saved to $json_file"
