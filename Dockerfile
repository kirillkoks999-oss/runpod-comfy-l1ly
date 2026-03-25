FROM runpod/worker-comfyui:5.8.5-base

RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/Suzie1/ComfyUI_Comfyroll_CustomNodes /comfyui/custom_nodes/ComfyUI_Comfyroll_CustomNodes

RUN if [ -f /comfyui/custom_nodes/ComfyUI_Comfyroll_CustomNodes/requirements.txt ]; then \
      pip install --no-cache-dir -r /comfyui/custom_nodes/ComfyUI_Comfyroll_CustomNodes/requirements.txt; \
    fi

CMD ["/bin/bash", "-lc", "rm -rf /comfyui/models/vae /comfyui/models/text_encoders /comfyui/models/diffusion_models && ln -s /runpod-volume/comfyui/models/vae /comfyui/models/vae && ln -s /runpod-volume/comfyui/models/text_encoders /comfyui/models/text_encoders && ln -s /runpod-volume/comfyui/models/diffusion_models /comfyui/models/diffusion_models && echo '=== CHECK VAE ===' && ls -lh /comfyui/models/vae && echo '=== CHECK TEXT_ENCODERS ===' && ls -lh /comfyui/models/text_encoders && echo '=== CHECK DIFFUSION_MODELS ===' && ls -lh /comfyui/models/diffusion_models && echo '=== CHECK CUSTOM NODES ===' && ls -1 /comfyui/custom_nodes && /start.sh"]
