from huggingface_hub import InferenceClient

client = InferenceClient(
	provider="together",
	api_key="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"
)

messages = [
	{
		"role": "user",
		"content": "What is the capital of France?"
	}
]

completion = client.chat.completions.create(
    model="mistralai/Mistral-7B-Instruct-v0.3", 
	messages=messages, 
	max_tokens=500,
)

print(completion.choices[0].message)