class AddTorrentOptions {}

class AddTransmissionTorrentOptions extends AddTorrentOptions {
  String? magnetLink;
  String? metainfo;
  String? downloadDir;
  bool? paused;
  int? peerLimit;
  int? bandwidthPriority;
  Map<String, dynamic>? filesWanted;
  Map<String, dynamic>? filesUnwanted;
  Map<String, dynamic>? priorityHigh;
  Map<String, dynamic>? priorityLow;
  Map<String, dynamic>? priorityNormal;

  AddTransmissionTorrentOptions({
    this.magnetLink,
    this.metainfo,
    this.downloadDir,
    this.paused,
    this.peerLimit,
    this.bandwidthPriority,
    this.filesWanted,
    this.filesUnwanted,
    this.priorityHigh,
    this.priorityLow,
    this.priorityNormal,
  }) : assert((magnetLink != null) ^ (metainfo != null),
            'Exactly one of magnetLink or metainfo must be non-null');

  Map<String, dynamic> toArguments() {
    final map = <String, dynamic>{};

    if (magnetLink != null) {
      map["filename"] = magnetLink;
    } else if (metainfo != null) {
      map["metainfo"] = metainfo;
    }

    if (downloadDir != null) {
      map["download-dir"] = downloadDir;
    }
    if (paused != null) {
      map["paused"] = paused;
    }
    if (peerLimit != null) {
      map["peer-limit"] = peerLimit;
    }
    if (bandwidthPriority != null) {
      map["bandwidthPriority"] = bandwidthPriority;
    }
    if (filesWanted != null) {
      map["files-wanted"] = filesWanted;
    }
    if (filesUnwanted != null) {
      map["files-unwanted"] = filesUnwanted;
    }
    if (priorityHigh != null) {
      map["priority-high"] = priorityHigh;
    }
    if (priorityLow != null) {
      map["priority-low"] = priorityLow;
    }
    if (priorityNormal != null) {
      map["priority-normal"] = priorityNormal;
    }

    return map;
  }
}
