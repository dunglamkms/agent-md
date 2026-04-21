```
[DEBUG:dispatch] sending topic="prompt engineering best practices" to=researcher,writer,memory
[DEBUG:dispatch] memory completed in 1s
[DEBUG:dispatch] researcher completed in 5s
[DEBUG:dispatch] writer completed in 6s
```

## Prior Context

_(No prior run found for this topic.)_

## Research Findings

- Clearly define the task and desired output to minimize ambiguity in model responses.
- Use explicit instructions and context to guide the model toward the intended answer.
- Break complex tasks into smaller, sequential prompts for better results.
- Specify the format and length of the desired output to improve consistency.
- Provide examples of correct and incorrect outputs to steer model behavior.
- Use delimiters (e.g., quotes, code blocks) to separate instructions from input data.
- Iterate and refine prompts based on observed model performance.
- Avoid vague language and use precise terminology relevant to the domain.
- Test prompts across different scenarios to ensure robustness and reliability.
- Leverage system and user roles in multi-turn conversations for clearer context.

## Draft

# Prompt Engineering Best Practices

## Overview

Prompt engineering is the practice of crafting inputs to large language models (LLMs) to elicit accurate, relevant, and consistent outputs. As LLMs become central to software development, content generation, and decision support, the quality of prompts directly determines the quality of results. This report summarizes key practices for effective prompt design.

## Core Principles

### 1. Define the Task Clearly

Every prompt should state the task and desired output explicitly. Ambiguous instructions lead to unpredictable responses. Specify what the model should produce, including the format, length, and tone.

> **Example:** Instead of *"Tell me about Python,"* use *"Write a 200-word summary of Python's key features for a beginner audience."*

### 2. Provide Context and Constraints

Models perform better when given relevant context. Include background information, constraints, and any assumptions the model should operate under. Use system and user roles in multi-turn conversations to maintain clear context boundaries.

### 3. Use Explicit Formatting Instructions

Specify whether the output should be a list, table, paragraph, JSON, or code block. Defining structure upfront reduces the need for post-processing and improves consistency across runs.

## Techniques

### Decompose Complex Tasks

Break large or multi-step problems into smaller, sequential prompts. Each prompt handles one subtask, and the output of one feeds into the next. This chain-of-thought approach reduces errors and makes debugging easier.

### Provide Examples

Include examples of both correct and incorrect outputs. Few-shot prompting—where the prompt contains two or three demonstrations—anchors the model's behavior and reduces deviation from the intended format or reasoning.

### Use Delimiters

Separate instructions from input data using delimiters such as triple quotes, XML tags, or code blocks. This prevents the model from confusing user-provided content with operational instructions.

```
Summarize the following text:
"""
[input text here]
"""
```

### Use Precise Language

Avoid vague terms like *"good"* or *"detailed."* Replace them with measurable descriptors: *"under 100 words," "three bullet points,"* or *"formal academic tone."* Domain-specific terminology further reduces misinterpretation.

## Iteration and Testing

Prompt engineering is inherently iterative. Evaluate outputs against expected results, adjust wording or structure, and re-test. Robust prompts should be validated across multiple scenarios—including edge cases—to confirm reliability before deployment.

Key steps in the iteration cycle:

1. Draft an initial prompt with clear instructions.
2. Evaluate the output for accuracy, format, and completeness.
3. Identify failure modes (e.g., hallucination, format drift).
4. Refine the prompt to address observed issues.
5. Re-test across varied inputs.

## Summary

Effective prompt engineering relies on clarity, structure, and iteration. Defining tasks precisely, decomposing complexity, providing examples, and testing across scenarios are the foundational practices that yield reliable LLM outputs. As models evolve, these principles remain consistent: the more explicit and well-structured the input, the higher the quality of the output.

## Sources

1. [OpenAI: Best practices for prompt engineering](https://platform.openai.com/docs/guides/prompt-engineering)
2. [Google: Prompt Design for Large Language Models](https://cloud.google.com/vertex-ai/docs/generative-ai/text/prompt-design)
3. [Microsoft: Prompt Engineering Techniques](https://learn.microsoft.com/en-us/azure/ai-services/openai/how-to/prompt-engineering)
4. [DeepLearning.AI: Prompt Engineering Guide](https://www.deeplearning.ai/short-courses/chatgpt-prompt-eng/)
5. [OpenAI Cookbook: Prompt Engineering](https://github.com/openai/openai-cookbook/blob/main/examples/How_to_generate_text_with_chat_completions.ipynb)

---
_Generated by [Dryan Agent](dryan-agent.md) | Researcher: [researcher.md](researcher.md) | Writer: [writer.md](writer.md) | Memory: [memory-agent.md](memory-agent.md) | 2026-04-21_
