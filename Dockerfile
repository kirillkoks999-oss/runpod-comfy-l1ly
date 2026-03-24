FROM runpod/worker-comfyui:5.1.0-base

RUN pip install --no-cache-dir "huggingface_hub[hf_transfer]"

ENV HF_HUB_ENABLE_HF_TRANSFER=1

RUN python - <<'PY'
from huggingface_hub import hf_hub_download
import os

downloads = [
    ("rillky/LilyQwen", "L1ly.safetensors", "/comfyui/models/diffusion_models"),
    ("Comfy-Org/Qwen-Image_ComfyUI", "split_files/vae/qwen_image_vae.safetensors", "/comfyui/models/vae"),
    ("Comfy-Org/Qwen-Image_ComfyUI", "split_files/text_encoders/qwen_2.5_vl_7b_fp8_scaled.safetensors", "/comfyui/models/text_encoders"),
]

for repo_id, filename, target in downloads:
    print(f"Downloading {repo_id} :: {filename} -> {target}", flush=True)
    os.makedirs(target, exist_ok=True)
    out = hf_hub_download(
        repo_id=repo_id,
        filename=filename,
        local_dir=target,
        local_dir_use_symlinks=False,
    )
    print(f"OK: {out}", flush=True)
PY
