@echo off
cd ../..
if not exist log\bigbird md log\bigbird
set logpath=%cd%\log\bigbird

cd models_repo\examples\language_model\bigbird\

python -m paddle.distributed.launch --gpus %2 run_glue.py --model_type bigbird --model_name_or_path bigbird-base-uncased --task_name SST-2 --max_encoder_length 128 --batch_size 32 --learning_rate 1e-5 --epochs 1 --logging_steps 1 --save_steps 1 --max_steps 1 --output_dir ./tmp --device %1  > %logpath%\run_glue_%1.log 2>&1
