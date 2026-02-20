# Temporary Files (.tmp)

This directory contains **all intermediate files** generated during processing.

## Purpose

Store temporary files that are needed during processing but are not final deliverables:

- Scraped data
- Intermediate exports
- Processing logs
- Dossiers
- Cache files

## Important Rules

1. **Never commit**: This entire directory is in `.gitignore`
2. **Always regeneratable**: Everything here can be deleted and regenerated
3. **Not for deliverables**: Final outputs go to cloud services (Google Sheets, etc.) or project directories

## Cleanup

You can safely delete everything in this directory at any time:

```bash
rm -rf .tmp/*
```

All scripts should be able to regenerate these files as needed.

## Subdirectories

Organize by task type:

- `.tmp/scraping/` - Downloaded web content
- `.tmp/processing/` - Intermediate data processing
- `.tmp/exports/` - Temporary exports before uploading

## Guidelines

- Use descriptive filenames with timestamps
- Clean up after successful processing (optional)
- Never rely on files here persisting long-term
- Log file locations for debugging
