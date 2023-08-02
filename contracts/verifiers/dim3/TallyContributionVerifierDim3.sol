//
// Copyright 2017 Christian Reitwiessner
// Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
// The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//
// 2019 OKIMS
//      ported to solidity 0.6
//      fixed linter warnings
//      added requiere error messages
//
//
// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;
import "../../libs/Pairing.sol";
import "../../interfaces/IVerifier.sol";

contract TallyContributionVerifierDim3 is IVerifier {
    using Pairing for *;
    struct VerifyingKey {
        Pairing.G1Point alfa1;
        Pairing.G2Point beta2;
        Pairing.G2Point gamma2;
        Pairing.G2Point delta2;
        Pairing.G1Point[] IC;
    }
    struct Proof {
        Pairing.G1Point A;
        Pairing.G2Point B;
        Pairing.G1Point C;
    }

    function verifyingKey() internal pure returns (VerifyingKey memory vk) {
        vk.alfa1 = Pairing.G1Point(
            20491192805390485299153009773594534940189261866228447918068658471970481763042,
            9383485363053290200918347156157836566562967994039712273449902621266178545958
        );

        vk.beta2 = Pairing.G2Point(
            [
                4252822878758300859123897981450591353533073413197771768651442665752259397132,
                6375614351688725206403948262868962793625744043794305715222011528459656738731
            ],
            [
                21847035105528745403288232691147584728191162732299865338377159692350059136679,
                10505242626370262277552901082094356697409835680220590971873171140371331206856
            ]
        );
        vk.gamma2 = Pairing.G2Point(
            [
                11559732032986387107991004021392285783925812861821192530917403151452391805634,
                10857046999023057135944570762232829481370756359578518086990519993285655852781
            ],
            [
                4082367875863433681332203403145435568316851327593401208105741076214120093531,
                8495653923123431417604973247489272438418190587263600148770280649306958101930
            ]
        );
        vk.delta2 = Pairing.G2Point(
            [
                4728174547360763121578150513171327651472170052284924213229887811632787529712,
                1949929026054679396355320627063110739609620992797455067118754159422937017670
            ],
            [
                3824695403450123224785732798766166295010197359084845742865129855220370654330,
                19362225465188430359646273120886960545690231407809942336530721644537219154373
            ]
        );
        vk.IC = new Pairing.G1Point[](32);

        vk.IC[0] = Pairing.G1Point(
            7368780580210026081930498459549784219258739155254903682138403611917369532783,
            11480091614880609051641135528634852278790305554711413637503393542972993913163
        );

        vk.IC[1] = Pairing.G1Point(
            2957553095405357903230456813600583757838592762277295466501228424654489982473,
            14314300104011497059748866334989169567151551968137414476918255410111604825742
        );

        vk.IC[2] = Pairing.G1Point(
            3664737441178358103266289503093232937480203000556242973448228920268369284295,
            8844930743343756855576845452131982987234389121385269183087224222856255401521
        );

        vk.IC[3] = Pairing.G1Point(
            9546235688332213533617404755177621277157142955700091298316009186435498511297,
            9852232034978225162916910341653659975854467686264576062126472410723728641653
        );

        vk.IC[4] = Pairing.G1Point(
            11043885636158987262204806796887578141657176261636323753798550139565043115752,
            1500022792039649253125374384191839748534960591658178285512705768427105251921
        );

        vk.IC[5] = Pairing.G1Point(
            5603908488739406081017475739123396826479831717197481993355759176713874629696,
            21515206074272495849403560447903971888194510414598530057713342868999969197658
        );

        vk.IC[6] = Pairing.G1Point(
            21599129091451316843352116748890062845542602449675576479922245221944901853744,
            11051664732270550932651554924794849322096792546399883418753932977326282617637
        );

        vk.IC[7] = Pairing.G1Point(
            2067762039950582193220114071216043853556342794315083098885105101788090079193,
            1504856964121882036035218101976602674692138493885977487337563428879589160062
        );

        vk.IC[8] = Pairing.G1Point(
            7298876871195674385484552202246875987835160545815883552305495134628847204683,
            13966566057503945430111481742092379846097484821055710128328160622810451223154
        );

        vk.IC[9] = Pairing.G1Point(
            11470019386970094556265237550320247564801310472077704504666066585685397759267,
            6694874536637003545212182032299591223168078980718960122229231430857497693413
        );

        vk.IC[10] = Pairing.G1Point(
            4139442394095618541015251861067148520385569342985329122992991464393784850304,
            15975966887376392632113750626596256036251298611041424522029112489829174722185
        );

        vk.IC[11] = Pairing.G1Point(
            4863174497634930046232593259376900032862590657847366010248086780499282329336,
            2498510485224083712425544587484307467560613862590023276977943758858825633788
        );

        vk.IC[12] = Pairing.G1Point(
            5328070829975522358852515516636209151398324971969784444536757666746385079187,
            16093918077468179956262139097170976343695281642467114376680973200161846619255
        );

        vk.IC[13] = Pairing.G1Point(
            9666706535526291611151019583583584081009955402982294215577366960436865119067,
            689546924196634863935546098539226848418056026986469982835569896817157046415
        );

        vk.IC[14] = Pairing.G1Point(
            5130748884634604162756875978306737179210502818498991011927948410092945003094,
            8491140235717647686637284474153545290404249180649740642817144756053999226
        );

        vk.IC[15] = Pairing.G1Point(
            2615902451677864935823125056098516220213040760988352486776350292184307775478,
            13324549094601731688039431466114095187780809913707283297416446342013275726397
        );

        vk.IC[16] = Pairing.G1Point(
            10251408086105552552995373604765849373561545210146054289877915391159056089183,
            11373325779536377529833774787251090993725118708055667922544444749171401938342
        );

        vk.IC[17] = Pairing.G1Point(
            5886529166453562273644926229194373906934138559663020851375927604172520551101,
            13060617818453475871641904231289043252109704517780897958151759962844660312984
        );

        vk.IC[18] = Pairing.G1Point(
            10227321435401959673673330823695091144831452611786358481526975659307561030360,
            1507697772163503660729808704235038380288613317289509868695893056327083317394
        );

        vk.IC[19] = Pairing.G1Point(
            10144125154611673327548493608212635009866794782997315966906436258937286589958,
            3495943677087642849448978104119032618420923088612568749044871113930429117197
        );

        vk.IC[20] = Pairing.G1Point(
            12406693849411772966324042602721155763028580879001642655186663851646697315850,
            11733587334702729938491640372695546587955546318761669559374929049155977448922
        );

        vk.IC[21] = Pairing.G1Point(
            7621606488313255059400395171461719556015229364612086168244399686469097647455,
            3437535022943003091478687641717481290056604710662134108543044226868447680506
        );

        vk.IC[22] = Pairing.G1Point(
            20040061466056871919458940357691959751594534337311260121184259469644973038175,
            8897219500785674196015834753645868065233885613910581572065676373420392501453
        );

        vk.IC[23] = Pairing.G1Point(
            9006484552653684660934453663181358745019599884281979113144437148648649542663,
            10511834592152875901698730075956807532711601710582208271242420096002159583983
        );

        vk.IC[24] = Pairing.G1Point(
            10672452693731802685947594888698460727514480015274404855514191142417062958769,
            21859735178616085389164139794697876217192256265808504497050176597115217763680
        );

        vk.IC[25] = Pairing.G1Point(
            7308337044754082251158255130733149342836359225085154092182869465646847667075,
            6150906513959516626674667678053597399881356519085855485397785253768714539910
        );

        vk.IC[26] = Pairing.G1Point(
            10143810516667750450130732130131084174495550825292603987119254491525474060991,
            15898501066604822253238707659879205124603558110994047439029206120060485400178
        );

        vk.IC[27] = Pairing.G1Point(
            15945199110637579385974231660564535960424390276877283483661499137634147141085,
            14067698355793484730654696203491321583042414227525969374189035154061302741737
        );

        vk.IC[28] = Pairing.G1Point(
            15036615989767392660461565481263598442471717966018944513150774627526447529252,
            13150333641176798218502789360186719500984816744521655261649805567324846321095
        );

        vk.IC[29] = Pairing.G1Point(
            16539406041127755901757425333955682000431595579685573503768246465578190092358,
            5814573621074081421184508456335698091983155616232193623555170826827729051111
        );

        vk.IC[30] = Pairing.G1Point(
            1874421304879039721893961058975703783230088668966390732233401266630984019924,
            7208784274803872964118782452205824380736702841197220123822094467896948769592
        );

        vk.IC[31] = Pairing.G1Point(
            8046217628669247602474512868888024603622320364288848000115091149572965353753,
            17293276988468438011679660237325769001922342967288593741442684771078359436301
        );
    }

    function verify(
        uint[] memory input,
        Proof memory proof
    ) internal view returns (uint) {
        uint256 snark_scalar_field = 21888242871839275222246405745257275088548364400416034343698204186575808495617;
        VerifyingKey memory vk = verifyingKey();
        require(input.length + 1 == vk.IC.length, "verifier-bad-input");
        // Compute the linear combination vk_x
        Pairing.G1Point memory vk_x = Pairing.G1Point(0, 0);
        for (uint i = 0; i < input.length; i++) {
            require(
                input[i] < snark_scalar_field,
                "verifier-gte-snark-scalar-field"
            );
            vk_x = Pairing.addition(
                vk_x,
                Pairing.scalar_mul(vk.IC[i + 1], input[i])
            );
        }
        vk_x = Pairing.addition(vk_x, vk.IC[0]);
        if (
            !Pairing.pairingProd4(
                Pairing.negate(proof.A),
                proof.B,
                vk.alfa1,
                vk.beta2,
                vk_x,
                vk.gamma2,
                proof.C,
                vk.delta2
            )
        ) return 1;
        return 0;
    }

    /// @return r  bool true if proof is valid
    function verifyProof(
        uint[2] memory a,
        uint[2][2] memory b,
        uint[2] memory c,
        uint[] memory input
    ) public view override returns (bool r) {
        Proof memory proof;
        proof.A = Pairing.G1Point(a[0], a[1]);
        proof.B = Pairing.G2Point([b[0][0], b[0][1]], [b[1][0], b[1][1]]);
        proof.C = Pairing.G1Point(c[0], c[1]);
        uint[] memory inputValues = new uint[](input.length);
        for (uint i = 0; i < input.length; i++) {
            inputValues[i] = input[i];
        }
        if (verify(inputValues, proof) == 0) {
            return true;
        } else {
            return false;
        }
    }

    function getPublicInputsLength() external pure override returns (uint256) {
        return 31;
    }
}