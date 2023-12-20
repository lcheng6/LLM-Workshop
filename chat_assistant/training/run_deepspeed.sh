accelerate launch --config_file "configs/deepspeed_config.yaml"  train.py \
--seed 100 \
--model_name "mistralai/Mistral-7B-v0.1" \
--dataset_name "HuggingFaceH4/ultrachat_200k" \
--chat_template_format "chatml" \
--add_special_tokens False \
--append_concat_token False \
--splits "train_sft,test_sft" \
--max_seq_len 2048 \
--num_train_epochs 1 \
--logging_steps 5 \
--log_level "info" \
--logging_strategy "steps" \
--evaluation_strategy "epoch" \
--save_strategy "epoch" \
--push_to_hub \
--hub_private_repo True \
--hub_strategy "every_save" \
--bf16 True \
--packing True \
--learning_rate 2e-5 \
--lr_scheduler_type "cosine" \
--weight_decay 0.0 \
--warmup_ratio 0.1 \
--max_grad_norm 1.0 \
--output_dir "mistral-sft-ds" \
--per_device_train_batch_size 2 \
--gradient_accumulation_steps 4 \
--gradient_checkpointing False \
--dataset_text_field "content" \
--use_flash_attn True