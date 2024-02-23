class ReplicateResponseModel {
  final String completedAt;
  final String createdAt;
  final dynamic error;
  final String id;
  final Input input;
  final String logs;
  final Metrics metrics;
  final List<String> output;
  final String startedAt;
  final String status;
  final Urls urls;
  final String version;
    
  const ReplicateResponseModel({
    required this.completedAt,
    required this.createdAt,
    required this.error,
    required this.id,
    required this.input,
    required this.logs,
    required this.metrics,
    required this.output,
    required this.startedAt,
    required this.status,
    required this.urls,
    required this.version,
  });
  
  factory ReplicateResponseModel.fromMap(Map<String, dynamic> map) {
    return ReplicateResponseModel.placeholder().copyWith(
      completedAt: map["completed_at"],
      createdAt: map["created_at"],
      error: map["error"],
      id: map["id"],
      input: Input.fromMap(map["input"] ?? {}),
      logs: map["logs"],
      metrics: Metrics.fromMap(map["metrics"] ?? {}),
      output: List<String>.from(map["output"] ?? []),
      startedAt: map["started_at"],
      status: map["status"],
      urls: Urls.fromMap(map["urls"] ?? {}),
      version: map["version"],
    );
  }
  
  factory ReplicateResponseModel.placeholder() {
    return ReplicateResponseModel(
      completedAt: "2023-02-14T21:23:10.058604Z",
      createdAt: "2023-02-14T21:19:15.426349Z",
      error: null,
      id: "zgeqaoeoyzee5k72xrn7zp225q",
      input: Input.placeholder(),
      logs: """Global seed set to 954546
Data shape for DDIM sampling is (1, 4, 88, 64), eta 0.0
Running DDIM Sampling with 20 timesteps
DDIM Sampler:   0%|          | 0/20 [00:00<?, ?it/s]
DDIM Sampler:   5%|▌         | 1/20 [00:01<00:27,  1.46s/it]
DDIM Sampler:  10%|█         | 2/20 [00:02<00:23,  1.30s/it]
DDIM Sampler:  15%|█▌        | 3/20 [00:03<00:21,  1.25s/it]
DDIM Sampler:  20%|██        | 4/20 [00:05<00:19,  1.23s/it]
DDIM Sampler:  25%|██▌       | 5/20 [00:06<00:18,  1.21s/it]
DDIM Sampler:  30%|███       | 6/20 [00:07<00:16,  1.21s/it]
DDIM Sampler:  35%|███▌      | 7/20 [00:08<00:15,  1.21s/it]
DDIM Sampler:  40%|████      | 8/20 [00:09<00:14,  1.20s/it]
DDIM Sampler:  45%|████▌     | 9/20 [00:11<00:13,  1.20s/it]
DDIM Sampler:  50%|█████     | 10/20 [00:12<00:12,  1.20s/it]
DDIM Sampler:  55%|█████▌    | 11/20 [00:13<00:10,  1.20s/it]
DDIM Sampler:  60%|██████    | 12/20 [00:14<00:09,  1.20s/it]
DDIM Sampler:  65%|██████▌   | 13/20 [00:15<00:08,  1.20s/it]
DDIM Sampler:  70%|███████   | 14/20 [00:17<00:07,  1.21s/it]
DDIM Sampler:  75%|███████▌  | 15/20 [00:18<00:06,  1.21s/it]
DDIM Sampler:  80%|████████  | 16/20 [00:19<00:04,  1.21s/it]
DDIM Sampler:  85%|████████▌ | 17/20 [00:20<00:03,  1.21s/it]
DDIM Sampler:  90%|█████████ | 18/20 [00:21<00:02,  1.21s/it]
DDIM Sampler:  95%|█████████▌| 19/20 [00:23<00:01,  1.21s/it]
DDIM Sampler: 100%|██████████| 20/20 [00:24<00:00,  1.21s/it]
DDIM Sampler: 100%|██████████| 20/20 [00:24<00:00,  1.22s/it]""",
      metrics: Metrics.placeholder(),
      output: [],
      startedAt: "2023-02-14T21:22:39.500930Z",
      status: "succeeded",
      urls: Urls.placeholder(),
      version: "854e8727697a057c525cdb45ab037f64ecca770a1769cc52287c2e56472a247b",
    );
  }
  
  Map<String, dynamic> toMap() {
    return {
      "completed_at": completedAt,
      "created_at": createdAt,
      "error": error,
      "id": id,
      "input": input.toMap(),
      "logs": logs,
      "metrics": metrics.toMap(),
      "output": output,
      "started_at": startedAt,
      "status": status,
      "urls": urls.toMap(),
      "version": version,
    };
  }
  
  ReplicateResponseModel copyWith({
    String? completedAt,
    String? createdAt,
    dynamic error,
    String? id,
    Input? input,
    String? logs,
    Metrics? metrics,
    List<String>? output,
    String? startedAt,
    String? status,
    Urls? urls,
    String? version,
  }) {
    return ReplicateResponseModel(
      completedAt: completedAt ?? this.completedAt,
      createdAt: createdAt ?? this.createdAt,
      error: error ?? this.error,
      id: id ?? this.id,
      input: input ?? this.input,
      logs: logs ?? this.logs,
      metrics: metrics ?? this.metrics,
      output: output ?? this.output,
      startedAt: startedAt ?? this.startedAt,
      status: status ?? this.status,
      urls: urls ?? this.urls,
      version: version ?? this.version,
    );
  }
}

class Input {
  final String image;
  final num scale;
  final String prompt;
  final String aPrompt;
  final String nPrompt;
  final num ddimSteps;
  final String numSamples;
  final num valueThreshold;
  final String imageResolution;
  final num detectResolution;
  final num distanceThreshold;
    
  const Input({
    required this.image,
    required this.scale,
    required this.prompt,
    required this.aPrompt,
    required this.nPrompt,
    required this.ddimSteps,
    required this.numSamples,
    required this.valueThreshold,
    required this.imageResolution,
    required this.detectResolution,
    required this.distanceThreshold,
  });
  
  factory Input.fromMap(Map<String, dynamic> map) {
    return Input.placeholder().copyWith(
      image: map["image"],
      scale: map["scale"],
      prompt: map["prompt"],
      aPrompt: map["a_prompt"],
      nPrompt: map["n_prompt"],
      ddimSteps: map["ddim_steps"],
      numSamples: map["num_samples"],
      valueThreshold: map["value_threshold"],
      imageResolution: map["image_resolution"],
      detectResolution: map["detect_resolution"],
      distanceThreshold: map["distance_threshold"],
    );
  }
  
  factory Input.placeholder() {
    return const Input(
      image: "https://replicate.delivery/pbxt/IJZOELWrncBcjdE1s5Ko8ou35ZOxjNxDqMf0BhoRUAtv76u4/room.png",
      scale: 9,
      prompt: "a cheerful modernist bedroom",
      aPrompt: "best quality, extremely detailed",
      nPrompt: "longbody, lowres, bad anatomy, bad hands, missing fingers, extra digit, fewer digits, cropped, worst quality, low quality",
      ddimSteps: 20,
      numSamples: "1",
      valueThreshold: 0.1,
      imageResolution: "512",
      detectResolution: 512,
      distanceThreshold: 0.1,
    );
  }
  
  Map<String, dynamic> toMap() {
    return {
      "image": image,
      "scale": scale,
      "prompt": prompt,
      "a_prompt": aPrompt,
      "n_prompt": nPrompt,
      "ddim_steps": ddimSteps,
      "num_samples": numSamples,
      "value_threshold": valueThreshold,
      "image_resolution": imageResolution,
      "detect_resolution": detectResolution,
      "distance_threshold": distanceThreshold,
    };
  }
  
  Input copyWith({
    String? image,
    num? scale,
    String? prompt,
    String? aPrompt,
    String? nPrompt,
    num? ddimSteps,
    String? numSamples,
    num? valueThreshold,
    String? imageResolution,
    num? detectResolution,
    num? distanceThreshold,
  }) {
    return Input(
      image: image ?? this.image,
      scale: scale ?? this.scale,
      prompt: prompt ?? this.prompt,
      aPrompt: aPrompt ?? this.aPrompt,
      nPrompt: nPrompt ?? this.nPrompt,
      ddimSteps: ddimSteps ?? this.ddimSteps,
      numSamples: numSamples ?? this.numSamples,
      valueThreshold: valueThreshold ?? this.valueThreshold,
      imageResolution: imageResolution ?? this.imageResolution,
      detectResolution: detectResolution ?? this.detectResolution,
      distanceThreshold: distanceThreshold ?? this.distanceThreshold,
    );
  }
}

class Metrics {
  final num predictTime;
  final num totalTime;
    
  const Metrics({
    required this.predictTime,
    required this.totalTime,
  });
  
  factory Metrics.fromMap(Map<String, dynamic> map) {
    return Metrics.placeholder().copyWith(
      predictTime: map["predict_time"],
      totalTime: map["total_time"],
    );
  }
  
  factory Metrics.placeholder() {
    return const Metrics(
      predictTime: 30.557674,
      totalTime: 234.632255,
    );
  }
  
  Map<String, dynamic> toMap() {
    return {
      "predict_time": predictTime,
      "total_time": totalTime,
    };
  }
  
  Metrics copyWith({
    num? predictTime,
    num? totalTime,
  }) {
    return Metrics(
      predictTime: predictTime ?? this.predictTime,
      totalTime: totalTime ?? this.totalTime,
    );
  }
}

class Urls {
  final String get;
  final String cancel;
    
  const Urls({
    required this.get,
    required this.cancel,
  });
  
  factory Urls.fromMap(Map<String, dynamic> map) {
    return Urls.placeholder().copyWith(
      get: map["get"],
      cancel: map["cancel"],
    );
  }
  
  factory Urls.placeholder() {
    return const Urls(
      get: "https://api.replicate.com/v1/predictions/zgeqaoeoyzee5k72xrn7zp225q",
      cancel: "https://api.replicate.com/v1/predictions/zgeqaoeoyzee5k72xrn7zp225q/cancel",
    );
  }
  
  Map<String, dynamic> toMap() {
    return {
      "get": get,
      "cancel": cancel,
    };
  }
  
  Urls copyWith({
    String? get,
    String? cancel,
  }) {
    return Urls(
      get: get ?? this.get,
      cancel: cancel ?? this.cancel,
    );
  }
}