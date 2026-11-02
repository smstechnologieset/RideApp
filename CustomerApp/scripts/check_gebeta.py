"""Read-only check of existing map access; never print the credential or URLs."""
import json
from pathlib import Path
import re
from urllib.request import urlopen
from urllib.error import HTTPError

source = (Path(__file__).resolve().parents[1] / 'lib/core/services/gebeta_maps_service.dart').read_text(encoding='utf-8')
match = re.search(r"'(eyJ[^']+)'", source)
if not match:
    raise SystemExit('No existing map credential found. Supply GEBETA_API_KEY at build time.')
key = match.group(1)
requests = {
    'style': f'https://tiles.gebeta.app/styles/standard/style.json?apiKey={key}',
    'search': f'https://mapapi.gebeta.app/api/v1/route/geocoding?name=Meskel&apiKey={key}',
    'directions': f'https://mapapi.gebeta.app/api/route/direction/?origin=8.9890,38.7903&destination=9.0300,38.7500&apiKey={key}',
}
for name, url in requests.items():
    try:
        with urlopen(url, timeout=15) as response:
            data = json.load(response)
            details = {'http': response.status, 'keys': list(data)[:12]}
            if name == 'directions':
                points = data.get('direction', [])
                details.update(distance=data.get('totalDistance'), seconds=data.get('timetaken'), point_count=len(points), first_point=points[:1])
            elif name == 'search':
                details.update(result_count=len(data.get('data', [])))
            elif name == 'style':
                details.update(source_count=len(data.get('sources', {})), layer_count=len(data.get('layers', [])))
            print(name, json.dumps(details))
    except HTTPError as error:
        print(name, 'HTTP', error.code)
    except Exception as error:
        print(name, type(error).__name__, str(getattr(error, 'reason', type(error).__name__)))
