#!/usr/bin/env python3
"""Convert the local BibTeX bibliography into Jekyll data JSON."""

from __future__ import annotations

import json
import re
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
SOURCE = ROOT / "_bibliography" / "papers.bib"
TARGET = ROOT / "_data" / "publications.json"
PREVIEW_DIR = ROOT / "assets" / "img" / "publication_preview"


MONTHS = {
    "jan": "January",
    "feb": "February",
    "mar": "March",
    "apr": "April",
    "may": "May",
    "jun": "June",
    "jul": "July",
    "aug": "August",
    "sep": "September",
    "oct": "October",
    "nov": "November",
    "dec": "December",
}

LATEX_REPLACEMENTS = {
    r"{\'e}": "e",
    r"{\'E}": "E",
    r"{\"a}": "a",
    r"{\"A}": "A",
    r"{\"o}": "o",
    r"{\"O}": "O",
    r"{\"u}": "u",
    r"{\"U}": "U",
    r"\textit": "",
    r"\&": "&",
}


def split_entries(text: str) -> list[str]:
    entries: list[str] = []
    i = 0
    while i < len(text):
        at = text.find("@", i)
        if at == -1:
            break
        brace = text.find("{", at)
        if brace == -1:
            break
        depth = 0
        for j in range(brace, len(text)):
            if text[j] == "{":
                depth += 1
            elif text[j] == "}":
                depth -= 1
                if depth == 0:
                    entries.append(text[at : j + 1])
                    i = j + 1
                    break
        else:
            break
    return [entry for entry in entries if not entry.startswith("@string")]


def split_fields(body: str) -> dict[str, str]:
    fields: dict[str, str] = {}
    i = 0
    while i < len(body):
        match = re.search(r"([A-Za-z_][A-Za-z0-9_-]*)\s*=", body[i:])
        if not match:
            break
        key = match.group(1).lower()
        value_start = i + match.end()
        while value_start < len(body) and body[value_start].isspace():
            value_start += 1
        if value_start >= len(body):
            break
        if body[value_start] == "{":
            depth = 0
            value_end = value_start
            for value_end in range(value_start, len(body)):
                if body[value_end] == "{":
                    depth += 1
                elif body[value_end] == "}":
                    depth -= 1
                    if depth == 0:
                        break
            value = body[value_start + 1 : value_end]
            i = value_end + 1
        else:
            value_end = body.find(",", value_start)
            if value_end == -1:
                value_end = len(body)
            value = body[value_start:value_end].strip()
            i = value_end + 1
        fields[key] = clean(value)
    return fields


def clean(value: str) -> str:
    value = value.strip().strip('"')
    for old, new in LATEX_REPLACEMENTS.items():
        value = value.replace(old, new)
    value = re.sub(r"\s+", " ", value)
    value = value.replace("{", "").replace("}", "")
    return value.strip()


def parse_entry(entry: str) -> dict[str, object]:
    header, body = entry.split("{", 1)
    entry_type = header[1:].strip().lower()
    key, body = body.split(",", 1)
    fields = split_fields(body.rsplit("}", 1)[0])
    fields["id"] = key.strip()
    fields["type"] = entry_type
    if "month" in fields:
        fields["month"] = MONTHS.get(str(fields["month"]).lower(), fields["month"])
    fields["selected"] = str(fields.get("selected", "")).lower() == "true"
    if "journal" not in fields and "journaltitle" in fields:
        fields["journal"] = fields["journaltitle"]
    if "preview" in fields:
        fields["preview"] = resolve_preview(str(fields["preview"]))
    return fields


def resolve_preview(preview: str) -> str:
    path = PREVIEW_DIR / preview
    if path.exists():
        return preview
    stem = Path(preview).stem
    for candidate in PREVIEW_DIR.glob(f"{stem}.*"):
        return candidate.name
    return preview


def main() -> None:
    entries = [parse_entry(entry) for entry in split_entries(SOURCE.read_text())]
    entries.sort(key=lambda item: (int(item.get("year") or 0), item.get("id", "")), reverse=True)
    TARGET.write_text(json.dumps(entries, indent=2, ensure_ascii=False) + "\n")


if __name__ == "__main__":
    main()
