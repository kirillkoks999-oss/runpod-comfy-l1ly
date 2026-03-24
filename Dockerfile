FROM runpod/worker-comfyui:5.1.0-base

RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /comfyui/models/diffusion_models \
    /comfyui/models/vae \
    /comfyui/models/text_encoders

RUN curl -fL "https://huggingface.co/rillky/LilyQwen/resolve/main/L1ly.safetensors?download=true" \
    -o /comfyui/models/diffusion_models/L1ly.safetensors

RUN curl -fL "https://huggingface.co/Comfy-Org/Qwen-Image_ComfyUI/resolve/main/split_files/vae/qwen_image_vae.safetensors?download=true" \
    -o /comfyui/models/vae/qwen_image_vae.safetensors

RUN curl -fL "https://huggingface.co/Comfy-Org/Qwen-Image_ComfyUI/resolve/main/split_files/text_encoders/qwen_2.5_vl_7b_fp8_scaled.safetensors?download=true" \
    -o /comfyui/models/text_encoders/qwen_2.5_vl_7b_fp8_scaled.safetensors
