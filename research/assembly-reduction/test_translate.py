import unittest
from translate import translate, TranslationError


def function(body):
    return f".text\nf:\n{body}\n.size f, .-f\n"


class ParserTests(unittest.TestCase):
    def test_numeric_labels_forward_backward(self):
        _, m = translate(function("j 1f\n1: addi t0,t0,-1\nbnez t0,1b\nret"), "f")
        self.assertEqual([r["lean"] for r in m["instructions"]],
                         [".jump 1", ".addi 5 5 (-1)", ".branch .ne 5 0 1", ".ret"])

    def test_repeated_numeric_label(self):
        _, m = translate(function("1: nop\nj 1f\n1: ret"), "f")
        self.assertEqual(m["instructions"][1]["lean"], ".jump 2")

    def test_strict_rejections(self):
        for body in ["mystery a0,a1", "j missing", "j end\nret\nend:",
                     "li x32,1", "addi a0,a0,4096", "vle8.v v2,1(a1)",
                     "vadd.vv v8,v8,v16,v0.t", ".word 0", ".p2align 4\nret",
                     "same: nop\nsame: ret", "vsetvli a0,a1,e8,m8,ta,ma",
                     "call somewhere", "ret; add a0,a0,a1", "li a0,%hi(foo)"]:
            with self.subTest(body=body), self.assertRaises(TranslationError):
                translate(function(body), "f")

    def test_no_silent_truncation(self):
        with self.assertRaises(TranslationError):
            translate("f:\nret\n", "f")
        with self.assertRaises(TranslationError):
            translate(function("ret\nunknown a0"), "f")
        with self.assertRaises(TranslationError):
            translate(".if 0\n" + function("ret") + ".endif\n", "f")

    def test_function_selection(self):
        _, m = translate("irrelevant:\nunsupported_opcode\n" + function("ret"), "f")
        self.assertEqual(len(m["instructions"]), 1)


if __name__ == "__main__":
    unittest.main()
