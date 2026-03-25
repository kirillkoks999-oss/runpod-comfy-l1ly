FROM runpod/worker-comfyui:5.1.0-base

RUN mkdir -p /comfyui/models/diffusion_models /comfyui/models/vae /comfyui/models/text_encoders

CMD ["/bin/bash", "-lc", "ln -sf /runpod-volume/comfyui/models/diffusion_models/L1ly.safetensors /comfyui/models/diffusion_models/L1ly.safetensors && ln -sf /runpod-volume/comfyui/models/vae/qwen_image_vae.safetensors /comfyui/models/vae/qwen_image_vae.safetensors && ln -sf /runpod-volume/comfyui/models/text_encoders/qwen_2.5_vl_7b_fp8_scaled.safetensors /comfyui/models/text_encoders/qwen_2.5_vl_7b_fp8_scaled.safetensors && /start.sh"]
