from dataclasses import asdict, dataclass
from datetime import datetime
from typing import Dict, List, Optional, TypedDict


# PhysicalLog0 = namedtuple('PhysicalLog',
#                           ['log_name',
#                            'filename',
#                            'map_name',
#                            'description',
#                            'vehicle',
#                            'date', 'length',
#                            't0', 't1',  # these are in relative time
#                            'size', 'bag_info',
#                            'has_camera',
#                            'valid', 'error_if_invalid', ])

#  20160429224748_neptunus: !!omap
#   - log_name: 20160429224748_neptunus
#   - filename:
#   - resources: !!omap
#     - thumbnails.jpg: !!omap
#       - dtrv: '1'
#       - size: 1979291
#       - name: 20160429224748_neptunus.thumbnails.jpg
#       - mime: image/jpeg
#       - hash:
#           ipfs: QmNSbQPGbTCV5bRCa9hx2i8B82bRD2dskPooMUSrnqodwv
#           sha1: 1bdfeb71ef30c5e4330bc02800189a9b868162aa
#       - urls:
#         - file://idsc-rudolf/media/sdb/201801_andrea_duckietown/Dropbox/processed/thumbnails
#         /20160429224748_neptunus.thumbnails.jpg
#         - hash://sha1/1bdfeb71ef30c5e4330bc02800189a9b868162aa?size=1979291&name=20160429224748_neptunus
#         .thumbnails.jpg
#         - file:///ipfs/QmNSbQPGbTCV5bRCa9hx2i8B82bRD2dskPooMUSrnqodwv
#         - http://gateway.ipfs.io/ipfs/QmNSbQPGbTCV5bRCa9hx2i8B82bRD2dskPooMUSrnqodwv
#         - http://ipfs.duckietown.org:8080/ipfs/QmNSbQPGbTCV5bRCa9hx2i8B82bRD2dskPooMUSrnqodwv
#       - desc: ''


class PhysicalLogResource(TypedDict):
    dtrv: str
    size: int
    name: str
    mime: str
    hash: Dict[str, str]
    urls: List[str]
    desc: str


@dataclass
class PhysicalLog:
    log_name: str
    filename: Optional[str]
    resources: Dict[str, Dict[str, PhysicalLogResource]]
    description: dict  # not sure what was supposed to be. Maybe "text", "md", etc.?
    vehicle: Optional[str]
    date: Optional[datetime]
    length: Optional[float]
    t0: Optional[float]
    t1: Optional[float]
    size: int
    bag_info: Optional[dict]
    has_camera: Optional[bool]
    valid: bool
    error_if_invalid: Optional[str]


def yaml_from_physical_log(log: PhysicalLog) -> dict:
    return asdict(log)


def physical_log_from_yaml(data: dict) -> PhysicalLog:
    return PhysicalLog(**data)
