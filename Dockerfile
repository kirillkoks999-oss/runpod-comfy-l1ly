FROM runpod/worker-comfyui:5.8.5-base

RUN mkdir -p /comfyui/models/diffusion_models /comfyui/models/vae /comfyui/models/text_encoders

CMD ["/bin/bash", "-lc", "\
rm -f /comfyui/models/diffusion_models/L1ly.safetensors && \
rm -f /comfyui/models/vae/qwen_image_vae.safetensors && \
rm -f /comfyui/models/text_encoders/qwen_2.5_vl_7b_fp8_scaled.safetensors && \
ln -s /runpod-volume/models/diffusion_models/L1ly.safetensors /comfyui/models/diffusion_models/L1ly.safetensors && \
ln -s /runpod-volume/models/vae/qwen_image_vae.safetensors /comfyui/models/vae/qwen_image_vae.safetensors && \
ln -s /runpod-volume/models/text_encoders/qwen_2.5_vl_7b_fp8_scaled.safetensors /comfyui/models/text_encoders/qwen_2.5_vl_7b_fp8_scaled.safetensors && \
/start.sh"]
